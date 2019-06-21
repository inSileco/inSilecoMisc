#' Assign categories to a vector of values.
#'
#' Assigns a category to each element of a vector for a given set of threshold values. Note that category are always sorted.
#'
#' @author
#' Kevin Cazelles
#' @param x A numeric, complex, character or logical vector.
#' @param categ A set of threshold that are used to assign categories.
#' @param lower A logical, if TRUE elements equal to a given threshold values are included in the lower category, default is FALSE.
#' @return
#' A vector countaining values standing for categories into which elements of x have fallen.
#' @export
#' @examples
#' categorize(stats::runif(40), categ=c(0.5,0.75))
#' categorize(LETTERS[1:5], categ='C')
#' categorize(LETTERS[1:5], categ='C', lower=TRUE)
#' categorize(LETTERS[floor(5*stats::runif(20))+1], categ=LETTERS[1:5], lower=TRUE)


categorize <- function(x, categ, lower = FALSE) {
    ##
    categ <- sort(unique(categ))
    ##
    out <- rep(1, length(x))
    ##
    if (lower) {
        id <- which(x > categ[1L])
        out[id] <- out[id] + sapply(x[id], function(z) max(which(z > categ)))
    } else {
        id <- which(x >= categ[1L])
        out[id] <- out[id] + sapply(x[id], function(z) max(which(z >= categ)))
    }
    ##
    out
}
