#' Adjust the size of a vector of character strings
#'
#' Adjust the size of a vector of character strings to a given number of
#' characters by truncating it or adding specified extra characters.
#'
#' @param x a character vector, or a vector to be coerced to a character vector.
#' @param n a positive integer integer indicating the size of the
#' character string to be created.
#' @param extra a character vector, or a vector to be coerced to a character
#' vector that will be (partially) added to produced a string of a specific length.
#' @param before a logical. If `TRUE`, then the extra characters are added
#' before `x`.
#'
#' @details
#' This function was originally created to help getting a fixed number of digits
#' when naming files. The current version is more general, it allows to
#' add any string before or after to adjust the size. Not that if a character
#' is longer than expected, it will be adequately cut off. 
#'
#' @return
#' A character vector of the concatenated characters.
#'
#' @seealso
#' [base::sprintf()]
#'
#' @export
#' @examples
#' paste0('myfilename', adjustStrings(c(1:2,10,100), 3))
#' adjustStrings('# Comment', 20, '#', before=FALSE)


adjustStrings <- function(x, n, extra = 0, before = TRUE) {
    x <- strsplit(as.character(x), "")
    n <- floor(n)
    extra <- unlist(strsplit(as.character(extra[1L]), split = ""))
    ##
    unlist(lapply(x, adjustOneString, n, extra, before))

}

adjustOneString <- function(xx, n, extra = "0", before = TRUE) {
    sz <- length(xx)
    if (sz == n) out <- xx else {
        if (sz > n) {
            out <- xx[seq_len(n)]
        } else {
            if (before) {
                out <- c(rep(extra, length.out = n-sz), xx)
            } else out <- c(xx, rep(extra, length.out = n-sz))
        }
    }
    paste(out, collapse = "")
}