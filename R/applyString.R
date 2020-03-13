#' Apply a function on elements of a character string
#'
#' Apply a function on a given set of elements of a character string.
#'
#' @param x a character vector, or a vector to be coerced to a character vector.
#' @param FUN the function to be applied, see [base::lapply()].
#' @param pos a vector indicating the elements position.
#' @param pattern a pattern see [base::gregexpr()].
#'
#' @note
#' In case both `pos` or `pattern`, the latter is ignored.
#'
#' @return
#' A character vector.
#'
#' @export
#' @examples
#' applyString('cool',  pos = 1:2, FUN = toupper)
#' applyString(c('cool', 'pro'),  pattern = 'o', FUN = toupper)


applyString <- function(x, FUN, pos = NULL, pattern = NULL) {

    if (!is.character(x))
        x <- as.character(x)

    if (!is.null(pos)) {
        tmp <- strsplit(x, split = "")
        tmp_fun <- function(x) {
            x[pos] <- FUN(x[pos])
            paste(x, collapse = "")
        }
        out <- unlist(lapply(tmp, tmp_fun))
    } else {
        if (is.null(pattern)) {
            warning("neither pos nor pattern is defined", call. = FALSE)
            out <- NULL
        } else {
            mat <- gregexpr(pattern = pattern, text = x)
            tmp_mth <- regmatches(x, mat)
            # NB: regmatches(x, mat, invert = TRUE) returns '' if first or last elements
            # match the pattern. Therefore there is alwasy 2*n - 1 number of elements in the
            # vector to be created (n being the size of tmp_inv elements).
            tmp_inv <- regmatches(x, mat, invert = TRUE)
            out <- apply(cbind(tmp_mth, tmp_inv), 1, FUN = reassemble, f = FUN)
        }
    }
    out
}


reassemble <- function(x, f) {
    char1 <- unlist(x[[1L]])
    char2 <- unlist(x[[2L]])
    sz <- length(char1) + length(char2)
    out <- rep("", sz)
    out[seq(1, sz, 2)] <- char2
    if (sz > 1)
        out[seq(2, sz - 1, 2)] <- f(x[1L][[1L]])
    paste(out, collapse = "")
}
