#' Assign categories
#'
#' Assigns a category to each element of a vector for a given set of threshold
#' values.
#'
#' @param x a numeric, complex, character or logical vector.
#' @param categ a set of threshold values used to assign categories.
#' @param lower a logical. If `TRUE` threshold values (i.e. values within
#' `categ`) belongs to the lower category rather than the upper (default
#' behavior).
#'
#' @return
#' A vector of categories assigned.
#'
#' @export
#' @examples
#' categorize(stats::runif(40), categ=c(0.5,0.75))
#' categorize(LETTERS[1:5], categ='C')
#' categorize(LETTERS[1:5], categ='C',  lower=TRUE)
#' categorize(LETTERS[floor(5*stats::runif(20))+1], categ=LETTERS[1:5], lower=TRUE)

categorize <- function(x, categ, lower = FALSE) {
    categ <- unique(categ)
    if (lower) {
      unlist(lapply(x, function(y) sum(y > categ) + 1))
    } else unlist(lapply(x, function(y) sum(y >= categ) + 1))
}
