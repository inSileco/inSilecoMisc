#' Extract file name, extension and basename ofrom a path.é  
#' 
#' @param x a character string. Note that `getDetails()` also supports vector of paths. 
#' @param sep file separator, default used the platform-specific file separator see [.Platform()].
#' 
#' @details 
#' For more functionalities, have a look at package fs. 
#' 
#' @return 
#' Extract the file extension a character string (e.g. a path).
#' 
#' @export
#' @examples
#' getExtension("path1/path2/foo.R")
#' getFilename("path1/path2/foo.R")
#' getBasename("path1/path2/foo.R")
#' getLocation("path1/path2/foo.R")
#' getDetails("path1/path2/foo.R")
#' getDetails(list.files(recursive = TRUE)) 
#' getExtension("foo.R")
#' getBasename("foo.R")

getExtension <- function(x, sep = .Platform$file.sep) {
  pat <- paste0(".*", sep, "(.+)$")
  tmp <- sub(pat, "\\1", x)
  if (grepl('[[:graph:]]+\\.[^.\\/:*?"<>|\r\n]+$', tmp)) {
    # do not account for nultiple extension such as 
    sub('^[[:graph:]]+\\.([^\\.\\/:*\\?"<>|\r\n]+)$', "\\1", tmp)
  } else NA_character_
}

#' @describeIn getExtension Extract the file name from a character string, that is the base name and the file extension
#' @export
getFilename <- function(x, sep = .Platform$file.sep) {
  pat <- paste0(".*", sep, "(.+)$")
  tmp <- sub(pat, "\\1", x)
  # check whether it contains file basename + file extension 
  # the regex below should cover 99% of common file extensions
  if (grepl('[[:graph:]]+\\.[[:alnum:]\\+-\\!]+$', tmp)) {
    tmp
  } else NA_character_
}

#' @describeIn getExtension Extract the name of a file or a directory from a character string.
#' @export
getName <- function(x, sep = .Platform$file.sep) {
  pat <- paste0(".*", sep, "(.+)$")
  sub(pat, "\\1", x)
}

#' @describeIn getExtension Extract the base name of a file from a character string.
#' @export
getBasename <- function(x, sep = .Platform$file.sep) {
  pat <- paste0(".*", sep, "(.+)$")
  tmp <- sub(pat, "\\1", x)
  if (grepl('[[:graph:]]+\\.[^.\\/:*?"<>|\r\n]+$', tmp)) {
    # do not account for multiple extension such as 
    sub('(^[[:graph:]]+)\\.[^\\.\\/:*\\?"<>|\r\n]+$', "\\1", tmp)
  } else tmp
}

#' @describeIn getExtension Extract the location of the parent folfder from a character string.
#' @export
getLocation <- function(x, sep = .Platform$file.sep) {
  pat <- paste0("(.*)", sep, ".+$")
  tmp <- sub(pat, "\\1", x)
  if (tmp == x) {
    return(".")
  } else tmp
}

#' @describeIn getExtension Return a data frame with basic information for all elements of a vector of paths. 
#' @export
getDetails <- function(x, sep = .Platform$file.sep) {
  if (length(x) > 1) {
    do.call(rbind, lapply(x, getDetails))
  } else  {
    data.frame(
      Name = getName(x, sep),
      Location = getLocation(x, sep),
      Basename = getBasename(x, sep),
      Extension = getExtension(x, sep),
      Directory = dir.exists(x)
    )
  }
}