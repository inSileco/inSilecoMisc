# tblDown(list(CO2[1:2, ], CO2[3:6,]), "co2")


tblDown <- function(x, section = NULL, title = NULL, out = "./out.docx",
    caption = NULL, row.names = FALSE, ...) {

    stopifnot(is.list(x) | is.data.frame(x))
    fl <- tempfile(fileext = ".md")
    #
    if (is.data.frame(x)) {
        n <- 1
        tbl2md(x, section[1L], caption[1L], fl)
    } else {
        stopifnot(all(unlist(lapply(x, is.data.frame))))
        n <- length(x)
        # title
        if (!is.null(title)) {
            cat(glue("---\ntitle: {title}\n---\n\n"), file = fl)
        }
        # sections
        if (!is.null(section) & length(section) != n) {
            warning("section and x have different lengths")
            section <- expand_vec(section, n)
        }
        # section
        if (!is.null(caption) & length(caption) != n) {
            warning("caption and x have different lengths")
            caption <- expand_vec(caption, n)
        }
        #
        for (i in seq_along(x)) {
            tbl2md(x[[i]], section = section[i], caption = caption[i],
                file = fl, row.names = row.names, ...)
        }
    }
    #
    system(paste0(rmarkdown::pandoc_exec(), " ", fl, " -o ", out))
    unlink(fl)
    invisible(NULL)
}

tbl2md <- function(x, section = NULL, caption = NULL,
    row.names = row.names, file, ...) {
    if (!is.null(section)) {
        cat("# ", section, "\n", file = file, append = TRUE)
    }
    if (!is.null(caption)) {
        cat(kable(x, caption = caption, row.names = row.names, ...),
            sep = "\n", file = file, append = TRUE)
    } else cat(kable(x, ...), sep = "\n", file = file, append = TRUE)
    cat("\n\n", file = file, append = TRUE)
    invisible(NULL)
}

# makes x of length n
expand_vec <- function(x, n) {
    paste0(x, rep(seq_len(n), each = length(x)))[seq_len(n)]
}