#' Paste element and add elememt separators. 
#'
#' @param x vector of to be coerced to character strings (see [paste()]). 
#' @param comma element separator. 
#' @param and last element separator (for 3 elements in `x` and more).
#'
#' @export 
#' @examples
#' commaAnd(c("Judith", "Peter", "Rebecca"))

commaAnd <- function(x, comma = ", ", and = " and ") {
  if (length(x) > 1) {
    paste0(paste(x[-length(x)], collapse = comma), and, x[length(x)])
  } else x
}