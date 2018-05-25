#' @title Compute the mean along a vector
#' @description This function is a simple moving window function.
#'
#' @param vec a vector of numeric
#' @param n a intger indicating the size of the window
#'
#' @export
#'
#' @examples
#' meanAlong(1:10, 2)

meanAlong <- function(vec, n) {
    stopifnot(length(vec) >= n)
    out <- numeric(length(vec) - n + 1)
    tmp <- (1:n) - 1
    for (i in 1:length(out)) {
        out[i] <- mean(vec[i + tmp])
    }
    out
}
