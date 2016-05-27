#' Keep these words.
#'
#' Extract words based on their position in a character string, vectorised over \code{string}.
#'
#' @author
#' Kevin Cazelles
#'
#' @param string character Input vector. A character vector or list from which words will be extracted.
#' @param slc Vector of integer indicating the selected positions of the words to be kept.
#' @param punct.rm A logical indicating whether punctutation characters should be removed.
#' @param na.rm A logical indicating whether missing values should be removed.
#' @param collapse An optional character string used to separate selected words. Not \code{NA_character_}.
#'
#' @return A vector of the selected words concatened for each string.
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
        string %<>% gsub(pattern = "[[:punct:]]", replacement = "")
    ## 
    out <- string %>% stringsplit(split = " ") %>% lapply(FUN = function(x) x[slc])
    ## 
    if (na.rm) 
        out %<>% lapply(function(x) x[!is.na(x)])
    ## 
    if (!is.null(collapse)) 
        out %<>% lapply(paste, collapse = collapse)
    ## 
    return(out)
}
