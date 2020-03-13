#' Count words
#'
#' Function that counts the number of word in a character string.
#'
#' @author
#' Kevin Cazelles
#'
#' @param string Input vector. A character vector or list from which words will be extracted.
#' @param exclude character string containing a regular expression listing the character to be excluded.
#'
#' @return A vector of the number of word in each element of `sting`.
#'
#' @export
#' @examples
#' strex <- 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
#' wordCount(strex)
#' wordCount(c(strex,'A second character string.'))


wordCount <- function(string, exclude = "[[:punct:]]") {
    ##
    string %>% as.character %>%
      gsub(pattern = exclude, replacement = " ") %>%
      gsub(pattern = " +", replacement = " ") %>%
      strsplit(split = " ") %>%
      lapply(length) %>%
      unlist
}
