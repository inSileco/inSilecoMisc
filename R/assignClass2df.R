#' Assign a class to columns
#'
#' Assign a class to a set of column of a data frame. This function is designed
#' to ease the changes of column's class of a given data frame.
#'
#' @param x a data frame or a R object to be coerced into a data frame.
#' @param colid the identity of columns for which class are ti be changed.
#' @param cls a character vector containing the classes' names to be used in the
#' same order as `colid`. By default `cls` is repeated until its size equals
#' `colid`'s size.
#'
#' @return
#' A data.frame for which columns have the required classes.
#'
#' @export
#' @examples
#' df1 <- matrix(signif(runif(20),4), ncol=2)
#' df2 <- assignClass2df(df1, 2, 'character')
#' str(df1)
#' str(df2)


assignClass2df <- function(x, colid, cls) {
    ##
    x <- as.data.frame(x)
    stopifnot(colid %in% seq_len(ncol(x)))
    out <- x
    sz <- length(colid)
    cl <- rep(cls, length.out = sz)
    ##
    for (i in seq_len(sz))
        out[, colid[i]] <- methods::as(x[, colid[i]], cl[i])
    ##
    out
}
