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
#' @param data an optional dataframe to be added to the search path.
#' @return
#' A two-columns dataframe indicating the position of found elements in simple data frame
#' @seealso \code{\link[base]{which}}
#' @export
#' @examples
#' findThem(c(10,4,100), stats::rpois(1000,10))

findThem <- function(what, where, data = NULL) {
    if (!is.null(data)) {
        attach(data)
        on.exit(detach(data))
    }
    # 
    id <- which(what %in% where)
    if (length(id)) {
        out <- cbind(vhat = id, where = sapply(what[id], function(x) which(where == 
            x)))
        rownames(out) <- what[id]
    } else {
        out <- NA_integer_
    }
    return(out)
}
