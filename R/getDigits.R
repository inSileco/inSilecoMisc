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
#' @param x a character vector where digits are sought, or an object which can be coerced by `as.character` to a character vector.
#' @param collapse an optional character string to separate the results (see [base::paste()).
#'
#' @importFrom magrittr %>%
#' @export
#'
#' @return
#' A list of digits.
#'
#' @examples
#' getDigits('txt012-34')

getDigits <- function(x, collapse = NULL) {
    out <- strsplit(x, split = "\\D") %>% lapply(function(x) x[x != ""])
    if (!is.null(collapse))
        out <- lapply(out, paste, collapse = collapse)
    out
}
