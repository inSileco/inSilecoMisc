#' Compute the length of a strings.
#'
#' Compute the length of a vector of strings.
#'
#' @author
#' Kevin Cazelles
#'
#' @param s character vector or a object to be coered as a character vector.
#'
#' @export
#'
#' @examples
#' strLength(c(123))
#' strLength(c('/', 'four'))

strLength <- function(s) {
    s %<>% as.character
    out <- strsplit(s, split = "") %>% lapply(length) %>% unlist
    out
}
