#' Keep words and letters.
#'
#' Extract words and letters based on their position in character strings, vectorised over the input character string vector.
#'
#' @name keepWords
#'
#' @param str An input character vector or a list from which words will be
#' extracted.
#' @param slc Vector of integer indicating the selected positions of the words to be kept.
#' @param punct.rm A logical Should punctuation characters be removed? Note that this affects the order of character in a string.
#' @param na.rm A logical. Should missing values be removed?
#' @param collapse An optional character string used to separate selected words.
#' @param replacement a replacement for matched pattern in [base::gsub()].
#'
#' @return A vector of the selected words.
#' @export
#' @examples
#' strex <- 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
#' keepWords(strex)
#' keepWords(c(strex,'A second character string.'), slc=c(1,8), na.rm = TRUE)
#' keepWords(c(strex,'A second character string.'), slc=c(1,8), na.rm = TRUE, collapse='/')

keepWords <- function(str, slc = 1, punct.rm = TRUE, na.rm = FALSE, collapse = NULL) {
    ##
    if (punct.rm) str <- rmPunct(str, " ")
    ##
    out <- lapply(strsplit(str, split = " "), FUN = function(x) x[slc])
    ##
    if (na.rm)
        out <- lapply(out, function(x) x[!is.na(x)])
    ##
    if (!is.null(collapse))
        out <- lapply(out, paste, collapse = collapse)

    out
}

#' @describeIn keepWords A vector containing the selection of letters.
#' @export
#' @examples
#' strex <- c('Lorem ipsum', 'dolor sit', ' amet;')
#' keepLetters(strex, c(1,4))

keepLetters <- function(str, slc = 1, punct.rm = FALSE, collapse = "") {
    str <- as.character(str)
    if (punct.rm) str <- rmPunct(str)
    tmp <- lapply(strsplit(str, split = ""), FUN = function(x) x[slc])
    ##
    if (any(unlist(lapply(tmp, function(x) is.na(x))))) {
      warning("Empty selection")
      tmp <- lapply(tmp, function(x) x[!is.na(x)])
    }
    lapply(tmp, paste, collapse = collapse)
}

#' @describeIn keepWords remove punctuation
rmPunct <- function(str, replacement = "") {
  gsub("[[:punct:] ]+", replacement, str)
}
