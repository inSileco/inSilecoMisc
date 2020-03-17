#' Create a data frame from scratch or based on one or two data frames.
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
#' @param y data frame or a vector of strings that includes part of or all of
#'the column names of the data frame to be output.
#' @param yonly a logical. Should only `y` (or the `names(y)`) be used for the
#' data frame to be returned? Default is set to `FALSE` meaning that both the
#' names of `x` and the names of `y` are used.
#' @param ... further arguments to be passed to `dfTemplate`.
#'
#' @return
#' Returns a data frame with the desired characteristics.
#'
#' @export
#' @examples
#' dfTemplate(5, 2)
#' dfTemplate(5, 2, col_classes = "character")


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


#' @describeIn dfTemplate Returns a data frame that matches names in `y`.
#' @export
dfTemplateMatch <- function(x, y, yonly = FALSE, ...) {

  stopifnot(is.data.frame(x))
  stopifnot(class(y) %in% c("data.frame", "character"))

  if (is.data.frame(y))
    nmy <- names(y) else nmy <- y

  if (yonly)
    nm <- nmy else nm <- unique(c(nmy, names(x)))

  if (sum(!nm %in% names(x))) {
    cbind(
      x[names(x)[names(x) %in% nm]],
      dfTemplate(nm[!nm %in% names(x)], nrow(x), ...)
    )
  } else x[names(x)[names(x) %in% nm]]
}
