#' Duplicates elements of a data frame.
#'
#' Duplicates rows and columns of a given a data frame.
#'
#' @param x a data frame.
#' @param id.el identity of the elements to be duplicated.
#' @param times number of times elements are duplicated. Could be a vector of the same length as `id.el`.
#' @param append A logical. If `TRUE`, duplicated elements will be appended to the data frame otherwise duplicated elements remain next to their parent. Non-existing columns cannot be duplicated while non-existing rows can and produce `NA`.
#' @returns returns a data frame with duplicated rows.
#'
#' @export
#' @examples
#' data(iris, package='datasets')
#' iris2 <- duplicateRow(iris, id.el=1:50, times=2)
#' iris3 <- duplicateCol(iris, id.el=c('Petal.Length', 'Petal.Width'), times=c(1,2), append=TRUE)

duplicateRow <- function(x, id.el = 1, times = 1, append = FALSE) {
    pos <- sort(rep(id.el, times))
    if (class(pos) == "character")
        ord <- c(rownames(x), pos) else ord <- c(seq_len(nrow(x)), pos)
    if (!append)
        ord <- sort(ord)

    x[ord, ]
}

#' @describeIn duplicateRow returns a data frame with duplicated columns.
#' @export
duplicateCol <- function(x, id.el = 1, times = 1, append = FALSE) {
    pos <- sort(rep(id.el, times))
    if (class(pos) == "character")
        ord <- c(colnames(x), pos) else ord <- c(seq_len(ncol(x)), pos)
    if (!append)
        ord <- sort(ord)
    x[, ord]
}
