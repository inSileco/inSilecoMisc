#' Pre-formatted message functions
#'
#' Convenient functions to sent notices to the user while a function/script is
#' being executed.
#'
#' @param ... text to be passed to [paste()].
#'
#' @note
#' All of these functions call [message()], so for any function `FUN()` using #' them, `suppressMessages(FUN())` is sufficient to mute all messages.
#'
#' @seealso
#' [cli::symbol] [message()]
#'
#' @return
#' Reports an info.
#'
#' @export
#' @examples
#' msgInfo("computing")
#' msgSuccess("done")
#' msgError("you got it wrong")
#' msgWarning("be careful")

msgInfo <- function(...) {
  txt <- paste(cli::symbol$info, ...)
  message(blue(txt))
  invisible(txt)
}

#' @describeIn msgInfo Reports an Error.
#' @export
msgError <- function(...) {
  txt <- paste(cli::symbol$cross, ...)
  message(red(txt))
  invisible(txt)
}

#' @describeIn msgInfo Reports a success.
#' @export
msgSuccess <- function(...) {
  txt <- paste(cli::symbol$tick, ...)
  message(green(txt))
  invisible(txt)
}

#' @describeIn msgInfo Reports a warning.
#' @export
msgWarning <- function(...) {
  txt <- paste(cli::symbol$warning, ...)
  message(yellow(txt))
  invisible(txt)
}

