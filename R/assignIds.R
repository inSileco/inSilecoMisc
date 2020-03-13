#' Assign an id to a list of characters or factors
#'
#' This function aims to assign an id to factor or similar character
#' strings. Regarding factors, [as.integer()] does such task but the order
#' obtained may differ
#'
#' @param x an R object to be coerced into character type.
#' @param alphabetical a logical indicating whether an alphabetical sorting
#' must be applied.
#' @return
#' A vector of Ids.
#' @export
#' @examples
#' assignIds(list(2,'f', 'd', 'f'))

assignIds <- function(x, alphabetical = FALSE) {
    tmp <- x %>% as.character %>% unique
    if (alphabetical)
        tmp <- sort(tmp)
    out <- tmp %>% length %>% integer
    for (i in seq_along(tmp)) out[x == tmp[i]] <- i
    out
}
