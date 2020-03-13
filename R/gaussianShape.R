#' Flexible bell-shaped function
#'
#' The `gaussianShape()` function computes a personnalisable Gaussian function.
#' Default values are the same as in [stats::dnorm()].
#'
#' @param x a numeric vector.
#' @param optx x-values at which the maximum is reached.
#' @param opty extremum value.
#' @param width width of the bell.
#' @param pow a real number.
#'
#' @return
#' A vector containing values standing for categories into which elements of x have fallen.
#' @seealso [stats::dnorm()]
#'
#' @export
#' @examples
#' gaussianShape(0)
#' plot(gaussianShape(1:1000, 500, 2, 250, pow=5), type='l')


gaussianShape <- function(x, optx = 0, opty = 1/sqrt(2 * pi), width = 1, pow = 2) {
    stopifnot(width != 0)
    opty * exp(-abs((x - optx)/width)^pow)
}
