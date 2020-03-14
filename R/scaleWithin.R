#' Scale a set of values
#'
#' This function maps a set of values to a range of integers (from 1
#' to a positive integer passed as an argument).
#'
#' @param x a numeric object of type `numeric` or coercible as one.
#' @param nval an integer designing The number of scaled values (between 1 and `nval`).
#' @param mn minimum value (`mn` and lower values are set to 1).
#' @param mx maximum value (`mx` and higher values are set to `nval`).
#'
#' @details
#' This function was originally created to ease the creation of custom color
#' scales. In such context, it is common practice to define a minium and a
#' maximum for the set of values to be displayed values as well as a number of
#' color to be used in the color scale (`nval`). This is exactly what
#' `scaleWithin()` does: minimum and maximum are by default the ones of the set
#' of values `x` but can also be set using `mn` and `mx` in which case values
#' below `mn` will be set to `mn` (and thus to 1 in the output) and values
#' above `mx` will be set to `mx` (and thus to 1 in the output). Finally, the
#' number of colors to be used used in is given by `nval`.
#'
#' @return
#' A numeric vector
#'
#' @export
#' @examples
#' x <- stats::rpois(20, 20)
#' scaleWithin(x, 20, 10, 30)
#' scaleWithin(matrix(x, 10, 2), mn = 20, mx = 30)

scaleWithin <- function(x, nval = 100, mn = min(x), mx = max(x)) {
    stopifnot(mn < mx)
    stopifnot(nval > 1)
    ##
    out <- 1 + floor(nval * (x - mn)/(mx - mn))
    out[out < 1] <- 1
    out[out > nval] <- nval
    out
}
