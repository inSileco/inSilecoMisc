#' Keep these words.
#'
#' Extract words based on their position in a character string, vectorised over
#' `string`.
#'
#' @author
#' Kevin Cazelles
#'
#' @param string An input character vector or a list from which words will be
#' extracted.
#' @param slc Vector of integer indicating the selected positions of the words to be kept.
#' @param punct.rm A logical Should punctuation characters be removed?
#' @param na.rm A logical. Should missing values be removed?
#' @param collapse An optional character string used to separate selected words.
#'
#' @return A vector of the selected words concatenated for each string.
#' @importFrom magrittr %>%
#' @importFrom magrittr %<>%
#' @export
#' @examples
#' strex <- 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
#' keepWords(strex)
#' keepWords(c(strex,'A second chacter string.'), slc=c(1,8), na.rm=TRUE)
#' keepWords(c(strex,'A second chacter string.'), slc=c(1,8), na.rm=TRUE, collapse='/')


keepWords <- function(string, slc = 1, punct.rm = TRUE, na.rm = FALSE, collapse = NULL) {
    ##
    if (punct.rm)
        string %<>% gsub(pattern = "[[:punct:]]", replacement = " ") %>% gsub(pattern = " +",
            replacement = " ")
    ##
    out <- string %>% strsplit(split = " ") %>% lapply(FUN = function(x) x[slc])
    ##
    if (na.rm)
        out %<>% lapply(function(x) x[!is.na(x)])
    ##
    if (!is.null(collapse))
        out %<>% lapply(paste, collapse = collapse)
    ##
    out
}
