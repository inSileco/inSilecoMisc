#' Multiple match
#'
#' Seek all elements matching a given pattern in a character strings.
#'
#' @param text a character vector where matches are sought, or an object which
#' can be coerced by as.character to a character vector, see `regexec`.
#' @param pattern character string containing a regular expression to be
#' matched in the given character vector, see `regexec`.
#'
#' @details
#' `multiMatch` is essentially a wrapper around [base::regexec()] and
#' [base::regmatches()] to find more than one match.
#'
#' @return
#' A vector of character strings matching `pattern` argument.
#' @export
#' @examples
#' multiMatch(loremIpsum(), " [[:alnum:]]{3} ")

multiMatch <- function(text, pattern) {
    ## ---
    text <- as.character(text)
    ## ----
    mat <- regexec(pattern = pattern, text)
    ref <- regmatches(text, mat)
    out <- ref[[1L]]
    ## ----
    k <- 1L
    while (k) {
        text <- sub(pattern, "", text)
        mat <- regexec(pattern = pattern, text)
        ref <- regmatches(text, mat)
        if (length(ref[[1L]]) > 0L) {
            out <- c(out, ref[[1L]])
        } else k <- 0L
    }
    out
}
