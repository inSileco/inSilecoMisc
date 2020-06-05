#' Create a data frame from scratch or based on one or two data frames
#'
#' This function handles the creation of data frames based on intuitive
#' parameters. It was originally designed to make row binding easier when
#' columns differs among data frame by creating data frames with the same
#' columns.
#'
#' @param cols either a number of column or a vector of character used as
#' columns names of the data frame to be returned.
#' @param nrows row number.
#' @param col_classes vector of column classes for the desired data frame.
#' By default, the class is determined by `fill`.
#' @param fill character or number used to fill out the columns. Default is `NA`.
#' @param x a data frame.
#' @param y a data frame or a vector of strings use to specifies column names to be included in the data frame.
#' @param yonly a logical. Should only `y` (or the `names(y)`) be used for the
#' data frame to be returned? Default is set to `FALSE` meaning that both the
#' names of `x` and the names of `y` are used.
#' @param order a logical. Should column of the output data frame be ordered
#' according to the template. Not that if there are more columns in `x` that
#' are not in `y`, then if `order = TRUE` column of `y` will be added first
#' (on the left of the output data frame).
#'
#' @param ... further arguments to be passed to `dfTemplate()`.
#'
#' @return
#' Returns a data frame with the desired characteristics.
#'
#' @references
#' <https://insileco.github.io/2019/02/03/creating-empty-data-frames-with-dftemplate-and-dftemplatematch/>
#'
#' @export
#' @examples
#' dfTemplate(5, 2)
#' dfTemplate(5, 2, col_classes = "character")
#' dfA <- data.frame(col1 = c(1, 2), col2 = LETTERS[1:2])
#' dfB <- data.frame(col4 = c(1, 2), col2 = LETTERS[1:2])
#' dfTemplateMatch(dfA, c("col4", "col2"))
#' dfTemplateMatch(dfA, c("col4", "col2"), yonly = TRUE)
#' dfTemplateMatch(dfA, dfB, yonly = TRUE, order = TRUE)

dfTemplate <- function(cols, nrows = 1, col_classes = NULL, fill = NA) {

  stopifnot(class(cols) %in% c("character", "numeric"))
  if (!is.null(col_classes)) {
    stopifnot(
      all(col_classes %in% c("character", "factor", "logical", "numeric"))
    )
  }

  if (is.numeric(cols)) {
    nc <- cols
    nm <- paste0("Var", seq_len(nc))
  } else {
    nc <- length(cols)
    nm <- cols
  }

  lsfill <- lapply(rep_len(fill, nc), rep_len, nrows)

  if (!is.null(col_classes)) {
    lsfill <- mapply(
      function(x, y) methods::as(x, y),
      lsfill,
      rep_len(col_classes, nc),
      SIMPLIFY = FALSE
    )
  }

  names(lsfill) <- nm
  as.data.frame(lsfill)
}


#' @describeIn dfTemplate Returns a data frame that includes all columns specifies in `y`.
#' @export
dfTemplateMatch <- function(x, y, yonly = FALSE, order = FALSE, ...) {

  stopifnot(is.data.frame(x))
  stopifnot(class(y) %in% c("data.frame", "character"))

  if (is.data.frame(y))
    nmy <- names(y) else nmy <- y

  if (yonly) nm <- nmy else nm <- unique(c(nmy, names(x)))

  if (sum(!nm %in% names(x))) {
    out <- cbind(
      x[names(x)[names(x) %in% nm]],
      dfTemplate(nm[!nm %in% names(x)], nrow(x), ...)
    )
  } else out <- x[names(x)[names(x) %in% nm]]

  if (order) {
    out[nm]
  } else out

}
