#' Find citation tags.
#'
#' Finds Markdown and Latex citation tags in a given character stings or a file.
#'
#' @param text A character string to be searched within.
#' @param con A connection object or a character string that stand for a path,
#' ignored if \code{text} is used.
#' @param markdown logical. If \code{TRUE}, citation tags of Markdown langage are sought.
#'
#' @author
#' Kevin Cazelles
#'
#' @return
#' A dataframe with the citation keys and their frequence.
#' @export
#' @examples
#' test <- findRef(text='First \\cite{Pimm2000}, second \\Citep{May1972}')


findRef <- function(text, con, markdown = FALSE) {
    ##---
    if (missing(text)) {
        if (missing(con)) 
            stop("Either 'text' or 'con' must be specified.") else {
            lsfile <- readLines(con)
            text <- paste(unlist(lsfile), collapse = "")
        }
    }
    ## ----
    if (!markdown) 
        pat <- "[\\].{0,3}[cC]ite.{0,7}\\{[[:alnum:]]+}" else pat <- "@[[:alnum:]]+"
    tbref <- multiMatch(text = text, pattern = pat)
    ## ----
    if (markdown) 
        tbref <- table(sub("@", "", tbref)) else {
        tbref <- sub("[\\].{0,3}[cC]ite.{0,7}\\{", "", tbref)
        tbref <- table(sub("\\}", "", tbref))
    }
    tbref <- data.frame(key = names(tbref), freq = as.integer(tbref))
    tbref
}
