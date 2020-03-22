#' A simple function to associated p-values with symbols
#'
#' The `signifSymbols` function takes one vector of p-values and returns
#' a vector of symbols that correspond to thresholds that can be set. Default
#' thresholds values and symbols are the most common ones.
#'
#' @param pvalue a p-value for which a symbol is requested.
#' @param thresholds the threshold values that define category to which symbols are assigned.
#' @param symbols list of symbols.
#' @param notsignif symbols for non significant p-value.
#'
#' @export
#'
#' @examples
#' signifSymbols(.012)
#' signifSymbols(.008)
#' lapply(c(.2, .08, .04, .008, 0.0001), signifSymbols)

signifSymbols <- function(pvalue, thresholds = c(0.1, 0.05, 0.01, 0.001),
  symbols = c(".", "*", "**", "***"), notsignif = "n.s.") {

    stopifnot(length(symbols) == length(thresholds))
    pvalue <- as.numeric(pvalue)
    stopifnot(length(pvalue) == 1)
    ##
    id <- which(pvalue <= thresholds)
    if (length(id)) {
        symbols[max(id)]
    } else notsignif
}
