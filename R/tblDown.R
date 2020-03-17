#' Write data frames in a document
#'
#' Export a data frame or a list of data frames in a document using pandoc.
#'
#' @param x a data frame or a list of data frames.
#' @param output_file path to the output file. Its extension will be used by
#' pandoc to correctly render the final document in the write format.
#' @param section a vector of character strings used as section titles (optional).
#' @param caption a vector of character strings used as captions (optional).
#' @param title a character string used as a title for the document (optional).
#' @param row.names a logical. Should row names be added? See [knitr::kable()].
#' @param ... further arguments passed to [knitr::kable()].
#'
#' @details
#' This function calls [base::cat()] and [knitr::kable()] to write a Markdown
#' document containing a list of tables that is then converted into the
#' desired format. For `section` and `caption` if the length differ then
#' will be cut off or expanded.
#'
#' @return
#' A data frame whose columns have the desired classes.
#'
#' @references
#' <https://pandoc.org/MANUAL.html#tables>
#'
#' @export
#' @examples
#' \dontrun{
#' data(CO2)
#' tblDown(list(CO2[1:2, ], CO2[3:6,]))
#' tblDown(list(CO2[1:2, ], CO2[3:6,]), "./tables.pdf")
#' }

tblDown <- function(x, output_file = "./tables.docx", section = NULL,
    caption = NULL, title = NULL, row.names = FALSE, ...) {

    stopifnot(is.list(x) | is.data.frame(x))
    fl <- tempfile(fileext = ".md")
    # title
    if (!is.null(title)) {
        cat(glue("---\ntitle: {title}\n---\n\n"), file = fl)
    } else file.create(fl)
    #
    if (is.data.frame(x)) {
        n <- 1
        tbl2md(x, section = section[1L], caption = caption[1L],
            row.names = row.names, file = fl, ...)
    } else {
        stopifnot(all(unlist(lapply(x, is.data.frame))))
        n <- length(x)
        # sections
        if (!is.null(section) & length(section) != n) {
            message("`section` and `x` have different lengths")
            section <- expand_vec(section, n)
        }
        # section
        if (!is.null(caption) & length(caption) != n) {
            message("`caption` and `x` have different lengths")
            caption <- expand_vec(caption, n)
        }        #
        for (i in seq_along(x)) {
            tbl2md(x[[i]], section = section[i], caption = caption[i],
                file = fl, row.names = row.names, ...)
        }
    }
    #
    out <- system2(command = rmarkdown::pandoc_exec(),
        args = paste(fl, "-o", output_file))
    unlink(fl)
    invisible(NULL)
}

tbl2md <- function(x, section = NULL, caption = NULL,
    row.names = FALSE, file, ...) {
    if (!is.null(section)) {
        cat("# ", section, "\n", file = file, append = TRUE)
    }
    cat(kable(x, row.names = row.names, ...), sep = "\n", file = file,
        append = TRUE)
    if (!is.null(caption)) {
        cat("Table: ", caption, file = file, append = TRUE)
    }
    cat("\n\n", file = file, append = TRUE)
    invisible(NULL)
}

# makes x of length n
expand_vec <- function(x, n) {
    if (length(x) > n) {
        x[seq_len(n)]
    } else paste(x, rep(seq_len(n), each = length(x)))[seq_len(n)]
}