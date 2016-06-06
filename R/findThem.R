#' Find values in a given vector.
#'
#' Given a set of values and a vetor where the values must be found, the
#' \code{findThem} function records the matched values and the posiiton in the
#' vector where the values have been searched for.
#'
#' @author
#' Kevin Cazelles
#' @param what a vector a values to be searched for.
#' @param where a vector where values will be searched on.
#' @param todf a logical indicating whether the output object must be a dataframe.
#' @return
#' A list indicating matched positions for each elements of \code{what}. If \code{todf} is
#' TRUE then a three-columns dataframe is returned includeing values and positions
#' in both \code{what} and \code{where} vectors.
#' @seealso \code{\link[base]{which}}
#' @export
#' @examples
#' x <- stats::rpois(1000,10)
#' findThem(c(10,4,100), x)
#' findThem(c(10,4,100), x, todf=TRUE)

findThem <- function(what, where, todf = FALSE) {
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
            out <- data.frame(values = rep(names(tmp), sz), what = rep(1:length(what), 
                sz), where = unlist(tmp))
            rownames(out) <- NULL
        } else {
            out <- tmp
        }
    } else {
        out <- NA_integer_
    }
    return(out)
}
