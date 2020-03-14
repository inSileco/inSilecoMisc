#' Find values in a given vector.
#'
#' Given a set of values and a vector where the values must be found, the
#' `findThem` function records the matched values and the position in the
#' vector where the values have been searched for.
#'
#' @param what a vector a values to be searched for.
#' @param where a vector where values will be searched on.
#' @param todf a logical indicating whether the output object must be a data frame.
#' @param reportnomatch a logical. If `TRUE`, values without match are reported #' in the data frame with a NA. Only available if `todf` is `TRUE`. Default is
#' set to `FALSE`.
#' @return
#' A list indicating matched positions for each elements of `what`. If no
#' match is found then `NA` is returned. If `todf` is `TRUE`
#' then a three-columns data frame is returned including values and positions
#' in both `what` and `where` vectors.
#' @seealso [which()]
#' @export
#' @examples
#' x <- stats::rpois(1000,10)
#' findThem(c(10,4,100), x)
#' findThem(c(10,4,100), x, todf=TRUE)
#' findThem(c(10,4,100), x, todf=TRUE, reportnomatch=TRUE)

findThem <- function(what, where, todf = FALSE, reportnomatch = FALSE) {
    what <- as.vector(what)
    where <- as.vector(where)
    #
    out <- as.list(rep(NA, length(what)))
    #
    id <- which(what %in% where)
    if (length(id)) {
        tmp <- lapply(what, function(x) which(where == x))
        names(tmp) <- what
        if (todf) {
            sz <- unlist(lapply(tmp, length))
            if (reportnomatch) {
                tmp[sz == 0] <- NA
            }
            sz <- unlist(lapply(tmp, length))
            out <- data.frame(values = rep(names(tmp), sz),
                what = rep(seq_along(what), sz), where = unlist(tmp))
            rownames(out) <- NULL
        } else out <- tmp
    } else out <- NA_integer_
    out
}
