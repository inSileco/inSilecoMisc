#' Lorem Ipsum.
#'
#' Lorem ipsum text.
#'
#' @param n the number of words to be kept.
#'
#' @author
#' Kevin Cazelles
#'
#' @return
#' A character string with the desired number of words.
#' @export
#' @examples
#' loremIpsum(11)


loremIpsum <- function(n = NULL) {
  if (!)
    tmp <- strsplit(lorem, split = " ")[[1]][1:n]
    tmp <- tmp[!is.na(tmp)]
    out <- paste(tmp, collapse = " ")
  else
  out
}
