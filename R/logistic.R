#' @name logistic
#' @title Logistic functions
#'
#' @description
#' The `logisic` function describe the classical logistic function,
#'
#' @param x a numerical vector.
#' @param yneg assympotic values when x tends to \code{-Inf}.
#' @param ypos assympotic values when y tends to \code{-Inf}.
#' @param lambda scalar coefficient.
#' @param pow x exponent.
#' @param yzer values (for `logistic2` only).
#'
#' @details
#' The classic logistic equation is:
#'
#' \deqn{f(x) = \frac{ypos-yneg}{1+e^{-\lambda x^{pow}}}}{%
#'       f(x) = (ypos-yneg)/(1+exp(-\lambda x^pow))}
#'
#' A slightly different version is:
#'
#' \deqn{f(x) = yneg + \frac{1}{\frac{1}{ypos-yneg}+(\frac{1}{yzer-yneg}-\frac{1}{ypos-yneg})e^{-\lambda x^{pow}}}}{%
#'       f(x) = yneg + 1/(1/(ypos-yneg)+(1/(yzer-yneg)-1/ypos-yneg)exp(-\lambda x^pow))}
#'
#' @source
#' \href{https://en.wikipedia.org/wiki/Logistic_function}{wikipedia.org/wiki/Logistic_function}
#'
#' @return
#' A numeric vector.
#'
#' @export


logistic <- function(x, yneg = -1, ypos = 1, lambda = 1, pow = 1) {
    yneg + (ypos - yneg)/(1 + exp(-lambda * x^pow))
}


#' @describeIn logistic A slightly different logistic function.
#' @export

logistic2 <- function(x, yneg = -1, ypos = 1, lambda = 1, pow = 1, yzer = 0) {
    tmp <- ypos - yneg
    yneg + 1/(1/tmp + (1/(yzer - yneg) - 1/tmp) * exp(-lambda * x^pow))
}
