#' Search values or patterns in a vector
#'
#' Search values or patterns in a vector.
#'
#' @param x a vector of values or patterns to be searched for.
#' @param y a vector where x values are searched for.
#' @param isPattern should x be considered as a vector of patterns?
#' @param ... further arguments to be passed to [base::which()].
#'
#' @return
#' A list of positions. Each element corresponds to the matches for a specific x value.
#'
#' @export
#'
#' @examples
#' vec <- LETTERS[1:10]
#' spl <- sample(vec)
#' id <- unlist(whichIs(vec, spl))
#' identical(vec, spl[id])

whichIs <- function(x, y, isPattern = FALSE, ...) {
    if (isPattern) {
      our <- lapply(x, function(x) which(grepl(pattern = x, y), ...))
    } else lapply(x, function(x) which(y == x, ...))
}
