#' Add a web icon.
#'
#' Generates a HTML tag to include an icon from an iconic framework.
#'
#' @author
#' Kevin Cazelles
#'
#' @param name name of the icon to be added.
#' @param framework a character use to default is \code{fa} (which stands for Font-Awesome).
#' @param size default sets to \code{2},
#' @export
#'
#' @examples
#' addWebIcon('cc')

addWebIcon <- function(name, framework = "fa", size = 2) {
    paste0("<i class=\"", framework, " ", framework, "-", name, " ", framework, "-", 
        size, "x\"></i>")
}
