#' Mutiple match.
#'
#' Seek all elements that match a given pattern within a character strings.
#'
#' @param text a character vector where matches are sought, or an object which
#' can be coerced by as.character to a character vector, see \code{regexec}.
#' @param pattern character string containing a regular expression to be
#' matched in the given character vector, see \code{regexec}.
#'
#' @author
#' Kevin Cazelles
#'
#' @details
#' \code{multiMatch} is essentially a wrapper around some regex functions that
#' ease their usage.
#'
#' @return
#' A vector of character strings matching \code{pattern} argumemt.
#' @export
#' @examples
#' multiMatch('Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
#' eiusmod tempor incididunt ut labore et dolore magna aliqua.',' [[:alnum:]]{1,3} ')

multiMatch <- function(text, pattern) {
    ## ----
    mat <- regexec(pattern = pattern, text)
    ref <- regmatches(text, mat)
    tbref <- ref[[1L]]
    ## ----
    if (!length(ref)) 
        stop("No pattern found") else {
        k <- 1L
        while (k) {
            text <- sub(pattern, "", text)
            mat <- regexec(pattern = pattern, text)
            ref <- regmatches(text, mat)
            if (length(ref[[1L]]) > 0L) {
                tbref <- c(tbref, ref[[1L]])
            } else k <- 0L
        }
    }
    tbref
}
