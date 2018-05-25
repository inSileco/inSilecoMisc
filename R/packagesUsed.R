#' @title
#' Get a data frame of package and their installed version.
#'
#' @description
#' Return a table of packages and their version.,
#'
#' @author
#' Kevin Cazelles
#'
#' @param vc_pkg a vector of string characters including the names of the package to be added.
#'
#' @export
#'
#' @return
#' A data frame of two columns. First is the name of the package; second the version installed.
#'
#' @examples
#' packagesUsed(c('utils', 'methods'))


packagesUsed <- function(vc_pkg) {
    ls_ver <- lapply(vc_pkg, function(x) as.character(utils::packageVersion(x)))
    df_pkg <- data.frame(name = vc_pkg, version = unlist(ls_ver))
    df_pkg
}