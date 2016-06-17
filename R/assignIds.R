#' Assign an id to a list of characters or factors
#'
#' This function is done mainly to assign an id to factor or similar character
#' strings. Regarding factors, \code{as.integer} does such task
#' but the order obtained could be different.
#'
#' @param x object to be coerced into character type
#' @param alphabetical a logical indicating whether an alphabetical sorting must be applied.
#'
#' @examples
#' assignIds(list(2,'f', 'd', 'f'))


assignIds <- function(vec, alphabetical = FALSE) {
    tmp <- vec %>% as.character %>% unique
    if (alphabetical) 
        tmp %<>% sort
    out <- tmp %>% length %>% integer
    for (i in 1:length(tmp)) out[vec == tmp[i]] <- i
    return(out)
}
