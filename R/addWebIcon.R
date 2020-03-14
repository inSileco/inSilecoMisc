#' Add a web icon.
#'
#' Generates a HTML tag to include an icon from an iconic framework.
#'
#' @param name name of the icon to be added.
#' @param framework a character use to default is `fa` (which stands for Font-Awesome).
#' @param size default sets to `2`,
#'
#' @export
#' @examples
#' addWebIcon('cc')

addWebIcon <- function(name, framework = "fa", size = 2) {
  paste0("<i class=\"", framework, " ", framework, "-", name, " ",
    framework, "-", size, "x\"></i>")
}
