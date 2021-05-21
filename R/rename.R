#' Rename object
#'
#' This function finds old names and replace them with new ones.
#'
#' @param x an object from which names can be extracted see [names()].
#' @param old a vector of character strings of old names.
#' @param new a vector of character strings of new names.
#' 
#' @export
#' @examples
#' tb <- data.frame(var1 = 2, var2 = "B")
#' rename(tb, "var1", "uptake")
#' rename(tb, c("var1", "var2"), c("uptake", "type"))

rename <- function(x, old, new) {
  stopifnot(length(new) == length(old))
  out <- x
  for (i in seq_along(old)) {
    if (sum(names(out) == old[i])) {
      names(out)[names(out) == old[i]] <- new[i]
    } else {
      msgWarning(old[i], "not a valid name.")
    }
  }
  out
}
 
