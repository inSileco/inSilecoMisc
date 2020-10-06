#' Pre-formatted message functions
#'
#' Convenient wrappers around [message()] to sent styled notices to the user 
#' while a function/script is being executed.
#'
#' @param ... text to be passed to [paste()].
#' @param appendLF a logical. Should messages given as a character string have 
#' a new line appended ? 

#'
#' @note
#' All of these functions call [message()], so for any function `FUN()` using #' them, `suppressMessages(FUN())` is sufficient to mute all messages.
#'
#' @seealso
#' [cli::symbol()] [message()]
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

msgInfo <- function(..., appendLF = TRUE) {
  txt <- paste(cli::symbol$info, ...)
  message(blue(txt), appendLF = appendLF)
  invisible(txt)
}

#' @describeIn msgInfo Reports an Error.
#' @export
msgError <- function(..., appendLF = TRUE) {
  txt <- paste(cli::symbol$cross, ...)
  message(red(txt), appendLF = appendLF)
  invisible(txt)
}

#' @describeIn msgInfo Reports a success.
#' @export
msgSuccess <- function(..., appendLF = TRUE) {
  txt <- paste(cli::symbol$tick, ...)
  message(green(txt), appendLF = appendLF)
  invisible(txt)
}

#' @describeIn msgInfo Reports a warning.
#' @export
msgWarning <- function(..., appendLF = TRUE) {
  txt <- paste(cli::symbol$warning, ...)
  message(yellow(txt), appendLF = appendLF)
  invisible(txt)
}

