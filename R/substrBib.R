#' Substract Bibtex entries.
#'
#' Substarct Bibtex entries that are encontered in a given text.
#'
#' @author
#' Kevin Cazelles
#'
#' @param bib An object of class \code{BibEntry} or \code{bibentry}.
#' @param text A character string to be searched within.
#' @param con  A connection object or a character string that stand for a path,
#' ignored if text is defined.
#' @param markdown logical. If \code{TRUE}, citation marks of Markdown langage are sought.
#' @export
#' @examples
#' file.name <- system.file('Bib', 'RJC.bib', package='RefManageR')
#' bib <- RefManageR::ReadBib(file.name)
#' # bib[[200]]
#' txt <- 'First \\cite{kim1995estimating}, second \\Citep{fu2006statistical}'
#' tfile <- tempfile(fileext = '.bib')
#' out <- substrBib(bib, txt)
#' # RefManageR::WriteBib(out, file=tfile)
#' unlink(tfile)
#'

substrBib <- function(bib, text, con, markdown = FALSE) {
    ## ----
    stopifnot(any(class(bib) %in% c("BibEntry", "bibentry")))
    ## 
    if (missing(text)) {
        if (missing(file)) 
            stop("Either 'text' or 'con' must be specified.") else citxt <- findRef(con = con, markdown = markdown)
    } else citxt <- findRef(text = text, markdown = markdown)
    ## ----substrBib
    keystxt <- as.character(citxt$Key)
    ## ----
    sz <- length(bib)
    keys <- character(sz)
    for (i in 1:sz) keys[i] <- bib[i]$key
    ## ----
    id <- which(keys %in% keystxt)
    ## ----
    if (!length(id)) {
        warning("No match found.")
        out <- NULL
    } else out <- bib[id]
    ## 
    out
}
