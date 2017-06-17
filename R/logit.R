#' Logit and its inverse.
#'
#' Compute the logit function and its inverse. Note that package \code{boot}
#' provides \code{logit} and \code{inv.logit} functions.
#'
#' @author
#' Kevin Cazelles
#'
#' @param x a object to be coerced to numeric.
#' @param inverse a logical. Should the inverse logit be computed?
#'
#' @importFrom magrittr %<>%
#'
#' @export
#'
#' @examples
#' logit(-10:10, inv=TRUE)


logit <- function(x, inv = FALSE) {
    x %<>% as.numeric
    if (inv) 
        return(exp(x)/(1 + exp(x))) else return(log(x/(1 - x)))
}
