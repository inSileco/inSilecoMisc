#' Get a data frame of package and their installed version.
#'
#' @param vc_pkg a vector of string characters including package names to be
#' added.
#'
#' @return
#' A data frame of two columns. First is the name of the package; second the version installed.
#'
#' @export
#' @examples
#' packagesUsed(c('utils', 'methods'))

packagesUsed <- function(vc_pkg) {
    ls_ver <- lapply(vc_pkg, function(x) as.character(utils::packageVersion(x)))
    data.frame(name = vc_pkg, version = unlist(ls_ver))
}
