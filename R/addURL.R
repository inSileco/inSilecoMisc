#' Add a URL
#'
#' Add a URL in HTML or Markdown format.
#'
#' @param url A URL.
#' @param text A character string to be searched within.
#' @param extra Extra A connection object or a character string that stand for a path,
#' ignored if text is defined.
#' @param markdown logical. If \code{TRUE}, hyperlinks  marks of Markdown language are sought.
#'
#' @export
#'
#' @examples
#' addURL('https://github.com/inSileco/letiRmisc', 'Github repo')
#' addURL('https://github.com/inSileco/letiRmisc', 'Github repo', markdown=TRUE)

addURL <- function(url, text = NULL, extra = NULL, markdown = FALSE) {
    url <- as.character(url)

    if (!is.null(text)) {
        text <- as.character(text)
    } else text <- url

    if (!is.null(extra)) {
        extra <- as.character(extra)
        extra <- paste0(" ", extra)
    } else extra <- ""

    if (!markdown) {
        out <- paste0("<a href='", url, "'", extra, ">", text, "</a>")
    } else {
        out <- paste0("[", text, "](", url, ")")
        if (nchar(extra))
            warning("markdown is 'TRUE' so 'extra' is ignored")
    }
    ##
    out
}
