#' Compute the length of a strings.
#'
#' Compute the length of a vector of strings.
#'
#' @author
#' Kevin Cazelles
#'
#' @param s character vector or a object to be coered as a character vector.
#' @param ignore a vector of characters to be ignored in the count.
#'
#' @export
#'
#' @examples
#' strLength(c(123))
#' strLength(c('/', 'four five'), ignore = c(" ", "f"))

strLength <- function(s, ignore = "") {
    s %<>% as.character
    out <- strsplit(s, split = "") %>%
      lapply(function(x) sum(! x %in% ignore)) %>%
      unlist
    out
}
