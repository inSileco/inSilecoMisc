#' @title
#' Extract digits from a character vector.
#'
#' @description
#' This function extracts all digits found in character vector and returns them
#' as a list.
#'
#' @author
#' Kevin Cazelles
#'
#' @param x a character vector where digits are sought, or an object which can be coerced by \code{as.character} to a character vector.
#' @param collapse super useful.
#'
#' @importFrom magrittr %>% %<>%
#'
#' @export
#'
#' @return
#' A list of digits.
#'
#' @details
#' This function is very useful!
#'
#' @examples
#' getDigits('cool012-99')

getDigits <- function(x, collapse = TRUE) {
    out <- strsplit(x, split = "\\D") %>% lapply(function(x) x[x != ""])
    if (collapse)
        out %<>% lapply(paste)
    out
}
