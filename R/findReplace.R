#' @title Find and replace
#'
#' @description
#' Functions to locate certain pattern and replace them.
#'
#' @author
#' Kevin Cazelles
#'
#' @param vec a vector where to search for patterns.
#' @param vec_pat vector providing the patterns to be searched for.
#' @param y values to replace matching values.
#'
#' @importFrom magrittr %>%
#' @export
#'
#' @details
#' These functions may be useful in case where many different patterns must be
#' replaced by the same value. Note that there are many other way to proceed.
#'
#' @examples
#' vec <- c('fish', 'crab', 'crabs', 'bug', 'crab')
#' findReplace(vec, 'crab', 'fish')
#' findReplace(vec, c('crab', 'crabs'), 'fish')
#' grepReplace(vec, 'crab[s]?', 'fish')
#' @describeIn findReplace Return a vector including the desire modifications.

findReplace <- function(vec, vec_pat, y) {
    vec[vec %in% vec_pat] <- y
    return(vec)
}


#' @describeIn findReplace Return a vector including the desire modifications.
#' @export
grepReplace <- function(vec, vec_pat, y) {
    res <- lapply(vec_pat, function(x) grepl(vec, pattern = x))
    res2 <- do.call(cbind, res) %>% apply(1L, sum)
    vec[res2 > 0] <- y
    return(vec)
}
