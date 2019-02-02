#' Create a data frame from scratch or based on one or two data frames.
#'
#' This function handles the creation of data frames based on intuitive parameters.
#' It was originally designed to make row binding easier when columns differs
#' among data frame by creating data frames with the same columns.
#'
#' @author
#' Kevin Cazelles
#'
#' @param cols either a number of column or a vector of character used as
#' columns names of the data frame to be returned.
#' @param nrows row number.
#' @param col_classes vector of column classes for the desired data frame.
#' By default, "character" is used for all columns.
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
#' assignIds(list(2,'f', 'd', 'f'))


dfTemplate <- function(cols, nrows = 1, col_classes = "character", fill = NA) {

  stopifnot(class(cols) %in% c("character", "numeric"))
  stopifnot(
    all(col_classes %in% c("character", "factor", "logical", "numeric"))
  )

  if (is.numeric(cols)) {
    nc <- cols
    nm <- paste0("Var", seq_len(nc))
  } else {
    nc <- length(cols)
    nm <- cols
  }

  lsr <-  mapply(
    function(x, y) methods::as(x, y),
    rep(list(rep(fill, nrows)), nc),
    rep_len(col_classes, nc),
    SIMPLIFY = FALSE
  )

  names(lsr) <- nm
  as.data.frame(lsr)
}

#' @describeIn dfTemplate Returns a data frame.
#' @export
dfTemplateMatch <- function(x, y, yonly = FALSE, ...) {

  stopifnot(is.data.frame(x))
  stopifnot(class(y) %in% c("data.frame", "character"))

  if (is.data.frame(y))
    nmy <- names(y) else nmy <- y

  if (yonly)
    nm <- nmy else nm <- unique(c(nmy, names(x)))

  if (sum(!nm %in% names(x))) {
    out <- cbind(
      x[names(x)[names(x) %in% nm]],
      dfTemplate(nm[!nm %in% names(x)], nrow(x), ...)
    )
  } else out <- x[names(x)[names(x) %in% nm]]

  out
}
