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
#' @param names_aggreg column names for aggregated columns.
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
#' aggregateCol(mat1, grp1, FUN = mean)

aggregateCol <- function(data, grp, names_aggreg = NULL, FUN = sum, ...) {
    ## format checking
    stopifnot(ncol(data) == length(grp))
    grp %<>% as.integer()
    data %<>% as.data.frame()
    args <- list(...)
    ## remove NA
    id <- which(!is.na(grp))
    data <- data[, id]
    grp <- grp[id]
    ##
    idz <- which(grp == 0)
    nz <- length(idz)
    ## avoid warnings pertaining to the use of '.'
    . <- "No note"
    ##
    if (ncol(data)) {
        ## keep columns for which grp==0
        tmp <- grp %>% unique %>% magrittr::extract(. != 0)
        tmp_df <- data.frame(matrix(nrow = nrow(data), ncol = length(tmp) + nz))
        if (nz) {
            tmp_df[, 1:nz] <- data[, idz]
            names(tmp_df)[1:nz] <- names(data)[idz]
        }
        ## aggregate column by grp using FUN
        if (length(tmp)) {
            k <- 0
            for (i in tmp) {
                k <- k + 1
                tmp_df[, nz + k] <- apply(data[, which(grp == i)], MARGIN = 1, FUN = FUN,
                  ...)
            }
            if (!is.null(names_aggreg)) {
                names(tmp_df)[(nz + 1):length(tmp_df)] <- names_aggreg
            }
        }
        ##
        out <- tmp_df
    } else out <- data
    ##
    out
}
