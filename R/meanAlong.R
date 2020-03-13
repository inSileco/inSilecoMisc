#' @title Compute the mean along a vector
#' @description This function is a simple moving window function.
#'
#' @param vec a vector of numeric
#' @param n an integer indicating the size of the window
#'
#' @export
#'
#' @examples
#' meanAlong(1:10, 2)

meanAlong <- function(vec, n) {
    stopifnot(length(vec) >= n)
    out <- numeric(length(vec) - n + 1)
    tmp <- (seq_len(n) - 1)
    for (i in seq_along(out)) {
        out[i] <- mean(vec[i + tmp])
    }
    out
}
