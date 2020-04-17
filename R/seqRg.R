#' Generate a regular sequence based on the range of a vector
#'
#' @param x a vector.
#' @param n the number of values in the output sequence.
#' @param offset extend or reduce the range .
#' @param prop a logical. If `TRUE`, then `offset` is a proportion of the range, otherwise `offset` is used as is.
#'
#'
#' @export
#' @examples
#' seqRg(runif(10), 10)
#' seqRg(1:10, 10, .5)

seqRg <- function(x, n, offset = 0, prop = TRUE) {
  rg <- range(x)
  if (prop) offset <- offset*diff(rg)
  seq(rg[1L] - offset, rg[2L] + offset, length.out = n)
}

