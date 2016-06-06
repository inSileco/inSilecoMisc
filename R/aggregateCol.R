#' Aggregate columns given an integer vector.
#'
#' The \code{aggregateCol} makes the computation of a given function on
#' subsets of columns easy. An integer vector, whose length is the number of
#' column of the input dataframe, is used to assign a group to each column
#' that explicits the subsetting. Furthermore columns can be either kept as is
#' using \code{0} or discarded by using \code{NA}.
#'
#' @author
#' Kevin Cazelles
#'
#' @param data a dataframe.
#' @param grp an integer vector assigning a group to each column of \code{data}
#' used to compute operations on a subset of columns. Any integer is a valid group,
#' \code{0} indicates that the column must be unchanged, \code{NA} is used to remove a
#' column.
#' @param FUN a function to be applied to all group of columns.
#' @param name_agreg column names for aggregated columns.
#' @param ... further arguments to be passed to \code{FUN}.
#' @return
#' A dataframe with the grouped columns.
#' @importFrom magrittr %>%
#' @importFrom magrittr %<>%
#' @seealso \code{\link[stats]{aggregate}}
#' @export
#' @examples
#' mat1 <- matrix(1:70,10)
#' grp1 <- c(NA,0,rep(1,5))
#' aggregateCol(mat1, grp1, FUN= mean)

aggregateCol <- function(data, grp, FUN = sum, name_agreg = NULL, ...) {
    ## format checking
    stopifnot(ncol(data) == length(grp))
    grp %<>% as.integer()
    data %<>% as.data.frame()
    ## remove NA
    id <- which(!is.na(grp))
    data <- data[, id]
    grp <- grp[id]
    ## 
    idz <- which(grp == 0)
    nz <- length(idz)
    ## 
    if (ncol(data)) {
        ## keep columns for which grp==0
        tmp <- grp %>% unique() %>% magrittr::extract(. != 0)
        tmp_df <- data.frame(matrix(nrow = nrow(data), ncol = length(tmp) + nz))
        if (nz) {
            tmp_df[, 1:nz] <- data[, idz]
            if (!is.null(colnames(mat1))) 
                colnames(tmp_df)[1:nz] <- colnames(data[, idz])
        } else {
            tmp <- grp
        }
        ## aggregate column by grp using FUN
        if (length(tmp)) {
            k <- 0
            for (i in tmp) {
                k <- k + 1
                tmp_df[, nz + k] <- apply(data[, which(grp == i)], 1, FUN = FUN, 
                  ...)
            }
            if (!is.null(name_agreg)) 
                names(tmp_df)[(nz + 1):length(tmp_df)] <- name_agreg
        }
        ## 
        out <- tmp_df
    } else out <- data
    ## 
    return(out)
}
