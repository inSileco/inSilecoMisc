#' A simple function to associated p-values with symbols.
#'
#' \code{signifSymbols} take one p-value and associated to symbols. The default
#' values used the most common symbols.
#'
#' @author
#' Kevin Cazelles
#'
#' @param pvalue a pvalue for which a symbol is requested.
#' @param thresholds the threshold values that define category to which symbols are assigned.
#' @param symbols list of symbols.
#' @param notsignif symbols for non significant p-value.
#'
#' @importFrom magrittr %<>%
#'
#' @export
#'
#' @examples
#' signifSymbols(.012)
#' signifSymbols(.008)
#' sapply(c(.2, .08, .04, .008, 0.0001), signifSymbols)

signifSymbols <- function(pvalue, thresholds = c(0.1, 0.05, 0.01, 0.001), symbols = c(".", 
    "*", "**", "***"), notsignif = "n.s.") {
    
    stopifnot(length(symbols) == length(thresholds))
    pvalue %<>% as.numeric
    stopifnot(length(pvalue) == 1)
    ## 
    id <- which(pvalue <= thresholds)
    if (length(id)) {
        out <- symbols[max(id)]
    } else {
        out <- notsignif
    }
    return(out)
}
