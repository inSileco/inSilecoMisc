#' @title
#' Extract digits from a character vector.
#'
#' @description
#' This function extracts all digits found in character vector and returns them
#' as a list.
#'
#' @param x a character vector where digits are sought, or an object which can be coerced by `as.character` to a character vector.
#' @param collapse an optional character string to separate the results (see [base::paste()).
#'
#' @return
#' A list of digits.
#'
#' @export
#' @examples
#' getDigits('txt012-34')

getDigits <- function(x, collapse = NULL) {
    out <- lapply(strsplit(x, split = "\\D"), function(x) x[x != ""])
    if (!is.null(collapse))
        out <- lapply(out, paste, collapse = collapse)
    out
}
