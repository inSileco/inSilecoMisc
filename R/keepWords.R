#' Keep a selection of words or letters
#'
#' Select words or letters based on their position in character strings.
#'
#' @name keepWords
#'
#' @param str an input character vector (or a list) from which words will be
#' extracted.
#' @param slc a vector of integer indicating the selected positions of the
#' words (or letters) to be kept.
#' @param collapse character string used to separate selected words (or
#' letters), if `NULL`, then selection is not collapsed and a list is returned.
#' @param na.rm a logical. Should missing values be removed?
#' @param split_words a character string containing a regular expression used
#' to split words.
#' @param rm_punct a character string containing a regular expression used to
#' remove punctuation characters.
#'
#' @return A vector (or a list) of the selected words.
#'
#' @seealso [strsplit()]
#'
#' @export
#' @examples
#' keepWords(loremIpsum(), 1:3)
#' keepWords(c(loremIpsum(),'Another character string!'), slc = c(1,4))
#' keepWords(c(loremIpsum(),'A second character string.'), slc = c(1,4),
#'  na.rm = TRUE, collapse = '/')

keepWords <- function(str, slc = 1, collapse = " ", na.rm = FALSE,
    split_words = "[\n\t\r[:punct:] ]+") {
    ##
    strsplit(str, split = split_words)
    out <- lapply(strsplit(str, split = split_words), `[`, slc)
    ##
    if (na.rm)
        out <- lapply(out, function(x) x[!is.na(x)])

    outWithCollapse(out, collapse)
}

#' @describeIn keepWords A vector (or a list) of the selected letters.
#' @export
#' @examples
#' strex <- c('Lorem ipsum', 'dolor sit', ' amet;')
#' keepLetters(strex, c(1,4))
#' keepLetters(strex, c(1,4), collapse = "")

keepLetters <- function(str, slc = 1, collapse = "", na.rm = FALSE,
    rm_punct = "[\n\t\r[:punct:] ]+") {
    str <- gsub(rm_punct, "", as.character(str))
    out <- lapply(strsplit(str, split = ""), FUN = function(x) x[slc])
    if (na.rm)
        out <- lapply(out, function(x) x[!is.na(x)])
    outWithCollapse(out, collapse)
}

#' @describeIn keepWords A vector (or a list) of initials.
#' @export
#' @examples
#' keepInitials("National Basketball Association")
keepInitials <- function(str, split_words = "[\n\t\r[:punct:] ]+",
    collapse = "") {
    out <- lapply(strsplit(str, split_words), keepLetters, collapse = "")
    outWithCollapse(out, collapse)
}

#' @describeIn keepWords A vector of the number of words for every character
#' strings passed as an input.
#' @export
#' @examples
#' wordCount(c("two words!", "... and three words"))
#' wordCount(loremIpsum())

wordCount <- function(str, split_words = "[\n\t\r[:punct:] ]+") {
      tmp <- strsplit(as.character(str), split_words)
      lengths(lapply(tmp, function(x) x[x!=""]))
}


outWithCollapse <- function(out, collapse) {
    if (is.null(collapse)) {
        out
    } else {
        unlist(lapply(out, paste, collapse = collapse))
    }
}
