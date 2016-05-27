#' Duplicate element of a dataframe.
#'
#' Duplicates rows and colmns of a given a dataframe.
#'
#' @author
#' Kevin Cazelles
#' @param x a data.frame.
#' @param id.el identity of the elements to be duplicated.
#' @param times number of times elements are duplicated. Could be a vector of the same length as id.el.
#' @param append A logical. If \code{TRUE}, duplicated elements will be appended to the dataframe.
#' @importFrom magrittr %>%
#' @importFrom magrittr %<>%
#' @export
#' @examples
#' data(iris, package='datasets')
#' iris2 <- duplicateRow(iris, id.el=1:50, times=2)
#' iris3 <- duplicateCol(iris, id.el=c('Petal.Length', 'Petal.Width'), times=c(1,2), append=TRUE)


#' @describeIn duplicateRow A dataframe with duplicated rows.
duplicateRow <- function(x, id.el = 1, times = 1, append = FALSE) {
    pos <- rep(id.el, times) %>% sort
    if (class(pos) == "character") 
        ord <- c(rownames(x), pos) else ord <- c(1:nrow(x), pos)
    if (!append) 
        ord %<>% sort
    return(x[ord, ])
}

#' @describeIn duplicateCol A dataframe with duplicated columns.
#' @export
duplicateCol <- function(x, id.el = 1, times = 1, append = FALSE) {
    pos <- rep(id.el, times) %>% sort
    if (class(pos) == "character") 
        ord <- c(colnames(x), pos) else ord <- c(1:ncol(x), pos)
    if (!append) 
        ord %<>% sort
    return(x[, ord])
}
