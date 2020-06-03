#' Timer and Stopwatch
#'
#' @param max_time time in seconds after which the stopwatch is forced to stop, use `Inf` to run it endlessly.
#' @param time initial time (in seconds) for the timer.
#' @param pause time duration of the pause between 2 time increments displayed (it should better be small).
#' @param digits number of digits displayed.
#'
#' @export
#' @examples
#' \dontrun{
#' stopwatch(10)
#' stopwatch(20)
#' }

stopwatch <- function(max_time = 1e3, pause = .01, digits = 5) {
  t0 <- Sys.time()
  dif <- k <- 0
  msgInfo("Press ctrl-C to stop!")
  on.exit(return(Sys.time() - t0))
  while(1 & difftime(Sys.time(), t0, units = "secs") < max_time) {
    dif <- (Sys.time() - t0)
    txt <- paste(" ", format(dif, digits = digits))
    k <- k + 1
    cat(txt, rep(" ", 15 + digits - nchar(txt)), "\r")
    Sys.sleep(pause)
  }
  msg <- "`max_time` has been reached!"
  if (nchar(msg) < 15 + digits) msg <- adjustStrings(msg, 15 + digits, " ",
    "left")
  msgWarning(msg)
}

#' @export
#' @describeIn stopwatch Timer
timer <- function(time, pause = .01, digits = 5) {
  t0 <- Sys.time()
  dif <- k <- 0
  msgInfo("Press ctrl-C to stop!")
  on.exit(return(difftime(Sys.time(), t0, units = "secs")))
  while(1 & dif < time) {
    dif <- difftime(Sys.time(), t0, units = "secs")
    txt <- paste(" ", format(time - dif, digits = digits))
    k <- k + 1
    cat(txt, rep(" ", 15 + digits - nchar(txt)), "\r")
    Sys.sleep(pause)
  }
  msgInfo(adjustStrings("the end!", 15 + digits, " ", "left"))
}

