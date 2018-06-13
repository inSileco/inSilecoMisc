#' Read yaml headers.
#'
#'  Read yaml headers.
#'
#' @param n the number of words to be kept.
#'
#' @author
#' Kevin Cazelles
#'
#' @return
#' A list.
#'
#' @export
#' @examples
#' loremIpsum(11)

readYamlHeader <- function(file){
  ## Read current file first line shoudl be ---
  if (readLines(file, 1) == "---") {
    doc <- readLines(file)[-1]
    id <- which(doc == "---")
    if (length(id)) {
      out <- yaml::yaml.load(paste(doc[1:id[1]], collapse="\n"))
    } else {
      warning("no yaml header detected")
      out <- NULL
    }
  } else {
    warning("no yaml header detected")
    out <- NULL
  }
  ##
  out
}
