#' Makes a data frame or a matrix square
#'
#' Add missing rows or columns based on names and Duplicates rows and columns
#' of a given a data frame.
#'
#' @param x an object to be coerced into matrix.
#' @param fill character string used to fill the additional rows and/or columns.
#' @param reorder a logical. Should names must be used to order rows and columns?
#'
#' @return
#' A square matrix.
#'
#' @export
#' @examples
#' mat <- matrix(1:12, 3, 4)
#' mat2 <- squaretize(mat)
#' matb <- matrix(1:12, 4, 3)
#' colnames(matb) <- LETTERS[1:3]
#' mat2b <- squaretize(matb)

squaretize <- function(x, fill = 0, reorder = TRUE) {
  ##
  mat <- as.matrix(x)
  sz <- dim(mat)
  ##
  if (!is.null(rownames(mat)) & !is.null(colnames(mat))) {
    ##-- add rows
    idr <- which(!colnames(mat) %in% rownames(mat))
    ra <- length(idr)
    #
    if (ra)
      mat <- rbind(mat, matrix(fill, nrow = ra, ncol = ncol(mat),
        dimnames = list(colnames(mat)[idr], colnames(mat))))
    ##-- add colums
    idc <- which(!rownames(mat) %in% colnames(mat))
    rc <- length(idc)
    #
    if (rc)
      mat <- cbind(mat, matrix(fill, nrow = nrow(mat), ncol = rc,
        dimnames = list(rownames(mat), rownames(mat)[idc])))
    ##--
    if (reorder) {
      mat <- mat[order(rownames(mat)), ]
      mat <- mat[, order(colnames(mat))]
    }
  } else {
    mis <- diff(dim(mat))
    if (mis > 0) {
      mat <- rbind(mat, matrix(fill, nrow = mis, ncol = ncol(mat),
        dimnames = list(NULL, colnames(mat))))
      if (!is.null(rownames(x)))
        rownames(mat) <- c(rownames(x), paste0("X", nrow(x) + seq_len(mis)))
    } else {
      if (mis < 0) {
        mis <- abs(mis)
        mat <- cbind(mat, matrix(fill, nrow = nrow(mat), ncol = mis,
          dimnames = list(rownames(mat), NULL)))
        if (!is.null(colnames(x)))
          colnames(mat) <- c(colnames(x), paste0("X", ncol(x) + seq_len(mis)))
      }
    }
  }
  mat
}
