#' Aggregate columns
#'
#' `aggregateCol()` performs summary statistics on a specific subset of columns.
#'
#' @param data a data frame.
#' @param grp an integer vector, one value per `data` column. Integers are used
#' to group `data` columns, column with the same integer will be pooled
#' together.  Any integer is a valid group, `0` indicates that the column must
#' be unchanged, `NA` removes columns.
#' @param FUN a function to be applied to all groups of columns.
#' @param names_aggreg column names for aggregated columns.
#' @param ... further arguments to be passed to `FUN`.
#'
#' @details
#' `grp` is an integer vector, whose length is the number of columns of the
#' input data frame, is used to assign a group to each column that explicit the
#' sub-setting. Furthermore columns can be either kept as is using `0` or
#' discarded using `NA`.
#'
#' @seealso [stats::aggregate()] [base::split]
#'
#' @return
#' A data frame with the grouped columns.
#'
#' @export
#'
#' @examples
#' mat1 <- matrix(1:70,10)
#' grp1 <- c(NA,0, 1, 1, 2, 2, 2)
#' aggregateCol(mat1, grp1, FUN = mean)

aggregateCol <- function(data, grp, names_aggreg = NULL, FUN = sum, ...) {
    ## format checking
    stopifnot(ncol(data) == length(grp))
    grp <- as.integer(grp)
    data <- as.data.frame(data)
    args <- list(...)
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
        tmp <- unique(grp)[unique(grp) != 0]
        tmp_df <- data.frame(matrix(nrow = nrow(data), ncol = length(tmp) + nz))
        if (nz) {
            tmp_df[, seq_len(nz)] <- data[, idz]
            names(tmp_df)[seq_len(nz)] <- names(data)[idz]
        }
        ## aggregate column by grp using FUN
        if (length(tmp)) {
            k <- 0
            for (i in tmp) {
                k <- k + 1
                tmp_df[, nz + k] <- apply(data[, which(grp == i)], MARGIN = 1,
                    FUN = FUN, ...)
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
