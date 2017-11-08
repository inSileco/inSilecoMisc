#' Count the words in your chracter strings.
#'
#' Function that counts the number of word in a character string.
#'
#' @author
#' Kevin Cazelles
#'
#' @param string Input vector. A character vector or list from which words will be extracted.
#'
#' @return A vector of the number of word in each element of \code{sting}.
#' @importFrom magrittr %>%
#' @importFrom magrittr %<>%
#' @export
#' @examples
#' strex <- 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
#' wordCount(strex)
#' wordCount(c(strex,'A second chacter string.'))


wordCount <- function(string) {
    ## 
    string %<>% as.character
    string %<>% gsub(pattern = "[[:punct:]]", replacement = " ") %>% gsub(pattern = " +", 
        replacement = " ")
    ## 
    string %>% strsplit(split = " ") %>% lapply(length) %>% unlist
}
