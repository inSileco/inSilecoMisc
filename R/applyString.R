#' Apply a function on elements of a character string
#'
#' Apply a function on a given set of elements of a character string.
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
#' applyString("dpiewd e0de de", FUN = toupper)


applyString <- function(s, pos = c(1,3), pattern = NULL, FUN = toupper) {
  tmp <- strsplit(s, split = "")
  tmp_fun <- function(x) {
    x[pos] %<>% FUN
    paste(x, collapse="")
  }
  lapply(tmp, tmp_fun) %>% unlist
  #
  if (!is.null(pattern))
}

mat <- gregexpr(pattern = "de", "deode A 0deoidA")
ref <- regmatches("deode A 0deoidA", mat)
