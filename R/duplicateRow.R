#' Duplicates elements of a dataframe.
#'
#' Duplicates rows and colmns of a given a dataframe.
#'
#' @author
#' Kevin Cazelles
#'
#' @param x a data.frame.
#' @param id.el identity of the elements to be duplicated.
#' @param times number of times elements are duplicated. Could be a vector of the same length as id.el.
#' @param append A logical. If \code{TRUE}, duplicated elements will be appended to the dataframe otherwise duplicated elements remain next to their parent. Non-existing columns cannot be duplicated while non-existing rows can and produce \code{NA}.
#'
#' @importFrom magrittr %>% %<>%
#' @export
#' @examples
#' data(iris, package='datasets')
#' iris2 <- duplicateRow(iris, id.el=1:50, times=2)
#' iris3 <- duplicateCol(iris, id.el=c('Petal.Length', 'Petal.Width'), times=c(1,2), append=TRUE)


#' @describeIn duplicateRow returns a dataframe with duplicated rows.
duplicateRow <- function(x, id.el = 1, times = 1, append = FALSE) {
    pos <- rep(id.el, times) %>% sort
    if (class(pos) == "character") 
        ord <- c(rownames(x), pos) else ord <- c(1:nrow(x), pos)
    if (!append) 
        ord %<>% sort
    
    x[ord, ]
}

#' @describeIn duplicateRow returns a dataframe with duplicated columns.
#' @export

duplicateCol <- function(x, id.el = 1, times = 1, append = FALSE) {
    pos <- rep(id.el, times) %>% sort
    if (class(pos) == "character") 
        ord <- c(colnames(x), pos) else ord <- c(1:ncol(x), pos)
    if (!append) 
        ord %<>% sort
    
    x[, ord]
}
