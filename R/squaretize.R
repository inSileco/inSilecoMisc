#' Makes a dataframe or a matrix square.
#'
#' Add missing rows or columns based on names and Duplicates rows and colmns of a given a dataframe.
#'
#' @author
#' Kevin Cazelles
#' @param x an R object to be coerced into matrix.
#' @param fill element used to fill the additionnal rows and/or columns.
#' @param reorder a logical indicating whether the names must be used to order rows and columns.
#' @importFrom magrittr %>%
#' @importFrom magrittr %<>%
#' @export
#' @return
#' A square matrix.
#' @examples
#' mat <- matrix(1:12, 3, 4)
#' mat2 <- squaretize(mat)
#' matb <- matrix(1:12, 4, 3)
#' colnames(matb) <- LETTERS[1:3]
#' mat2b <- squaretize(matb)


squaretize <- function(x, fill = 0, reorder = TRUE) {
    ## 
    mat <- x %>% as.matrix
    sz <- dim(mat)
    ## 
    . <- "No notes"
    ## 
    if (!is.null(rownames(mat)) & !is.null(colnames(mat))) {
        ##-- add rows
        idr <- colnames(mat) %in% rownames(mat) %>% `!` %>% which
        ra <- length(idr)
        # 
        if (ra) 
            mat %<>% rbind(matrix(fill, nrow = ra, ncol = ncol(.), dimnames = list(colnames(.)[idr], 
                colnames(.))))
        ##-- add colums
        idc <- rownames(mat) %in% colnames(mat) %>% `!` %>% which
        rc <- length(idc)
        # 
        if (rc) 
            mat %<>% cbind(matrix(fill, nrow = nrow(.), ncol = rc, dimnames = list(rownames(.), 
                rownames(.)[idc])))
        ##--
        if (reorder) {
            mat %<>% magrittr::extract(order(rownames(.)), )
            mat %<>% magrittr::extract(, order(colnames(.)))
        }
    } else {
        mis <- mat %>% dim %>% diff
        if (mis > 0) {
            mat %<>% rbind(matrix(fill, nrow = mis, ncol = ncol(.), dimnames = list(NULL, 
                colnames(.))))
            if (!is.null(rownames(x))) 
                rownames(mat) <- c(rownames(x), paste0("X", nrow(x) + 1:mis))
        } else {
            if (mis < 0) {
                mis %<>% abs
                mat %<>% cbind(matrix(fill, nrow = nrow(.), ncol = mis, dimnames = list(rownames(.), 
                  NULL)))
                if (!is.null(colnames(x))) 
                  colnames(mat) <- c(colnames(x), paste0("X", ncol(x) + 1:mis))
            }
        }
    }
    return(mat)
}
