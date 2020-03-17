#' Lorem ipsum.
#'
#' Returns a common form of the Lorem ipsum text an optionally a subset of it.
#'
#' @param n the number of words to be kept.
#'
#' @return
#' A character string with the desired piece of lorem ipsum.
#'
#' @references
#' https://en.wikipedia.org/wiki/Lorem_ipsum
#'
#' @export
#' @examples
#' loremIpsum(5)


loremIpsum <- function(n = NULL) {
    out <- loremText()
    if (!is.null(n)) {
        tmp <- strsplit(out, split = " ")[[1L]][seq_len(n)]
        tmp <- tmp[!is.na(tmp)]
        out <- paste(tmp, collapse = " ")
    }
    out
}

loremText <- function() {
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
}
