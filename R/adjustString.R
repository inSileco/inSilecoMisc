#' Adjust the size of a character string to a given number of characters
#'
#' Adjust the size of a character string to a given number of characters
#' by truncating it or adding specified extra characters.
#'
#' @author
#' Kevin Cazelles
#' @param x a character vector, or a vector to be coerced to a character vector.
#' @param szchar an integer indicating the size of the character string
#' to be created.
#' @param extra character vector, or a vector to be coerced to a character
#' vector that will be (partially) added to produced a string of
#' @param before logical. If TRUE, then the extra characters are added before
#' \code{x}
#'
#' @details
#' This function was originally created to help getting a fixed number of digits
#' when naming files. The current version is more general but it remains extremely
#' usefull to name files.
#'
#' @return
#' A character vector of the concatenated characters.
#'
#' @importFrom magrittr %>% %<>%
#' @importFrom magrittr extract2
#' @export
#' @examples
#' paste0('myfilename', adjustString(c(1:2,10,100), 3))
#' adjustString('# Comment', 20, '#', before=FALSE)


adjustString <- function(x, szchar, extra = 0, before = TRUE) {
    x %<>% as.character
    szchar %<>% as.numeric %>% floor %>% abs
    extra %<>% as.character %>% strsplit(split = "") %>% extract2(1)
    ##
    out <- x
    id1 <- nchar(x) < szchar
    ##
    . <- "No note"
    ##
    if (sum(id1) > 0) {
        val <- szchar - nchar(x[id1])
        out[id1] <- val %>% as.list %>% lapply(FUN = . %>% rep(extra, length.out = .) %>%
            paste(collapse = "")) %>% unlist
        if (before)
            out[id1] %<>% paste0(x[id1]) else out[id1] %<>% paste0(x[id1], .)
    }
    ##
    if (sum(!id1)) {
        out[!id1] <- strsplit(x[!id1], split = "") %>% lapply(FUN = . %>% rep(length.out = szchar) %>%
            paste(collapse = "")) %>% unlist
    }

    out
}
