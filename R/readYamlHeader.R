#' Reads YAML headers
#'
#' Reads YAML headers (typically found in Markdown files).
#'
#' @param con connection object or a character string.
#'
#' @return
#' A named list, see [yaml::yaml.load()] for more details.
#'
#' @export

readYamlHeader <- function(con) {
    ## Read current file first line should be ---
    if (readLines(con, 1L) == "---") {
        doc <- readLines(con)[-1L]
        id <- which(doc == "---")
        if (length(id)) {
            out <- yaml.load(paste(doc[seq_along(id[1])], collapse = "\n"))
        } else {
            warning("something wrong with the yaml header detected")
            out <- NULL
        }
    } else {
        warning("no yaml header detected")
        out <- NULL
    }
    out
}
