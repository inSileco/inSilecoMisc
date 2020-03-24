#' Adjust the size of character strings
#'
#' Adjust the size of character strings by adding extra characters. It allows
#' to constraint the size of the string or to add a specific number of extra
#' characters.
#'
#' @param x a character vector, or a vector to be coerced to a character vector.
#' @param n a positive integer indicating the size of character strings to be created or added.
#' @param extra a character vector, or a vector to be coerced to a character
#' vector that will be (partially) added to produced a string of a specific length.
#' @param align either "right", "left" or "center". If "right", then strings
#' will be right-aligned and so `extra`'s characters will be added to the left.
#' "right" is the opposite of "left" and if `align = "center"`, then extra
#' characters will be split in half and added on both sides.
#' @param add a logical should `extra` be added, in which case `n` characters
#' will be added to input strings.
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
#' adjustStrings('# Comment ', 20, '#', align = "left")


adjustStrings <- function(x, n, extra = 0, align = c("right", "left", "center"), add = FALSE) {
    x <- strsplit(as.character(x), "")
    n <- floor(n)
    extra <- unlist(strsplit(as.character(extra[1L]), split = ""))
    align <- match.arg(align)
    if (add) {
        out <- lapply(x, addExtra, n, extra, align)
    } else out <- lapply(x, adjustOneString, n, extra, align)
    unlist(out)
}


adjustOneString <- function(xx, n, extra, align) {
    sz <- length(xx)
    if (sz == n) out <- xx else {
        if (sz > n) {
            out <- xx[seq_len(n)]
        } else {
            r <- n-sz
            out <- addExtra(xx, r, extra, align)
        }
    }
    paste(out, collapse = "")
}

addExtra <- function(xx, r, extra, align) {
    if (align == "right") {
        out <- c(rep(extra, length.out = r), xx)
    } else if (align == "left") {
        out <- c(xx, rep(extra, length.out = r))
    } else {
        h <- floor(.5 * r)
        sq <- rep(extra, length.out = r)
        out <- c(head(sq, r - h), xx, tail(sq, h))
    }
    paste(out, collapse = "")
}