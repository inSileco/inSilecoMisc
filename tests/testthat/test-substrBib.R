library(letiRmisc)
context("Test substrBib")


file.name <- system.file('Bib', 'RJC.bib', package='RefManageR')
bib <- RefManageR::ReadBib(file.name)
txt <- 'First \\cite{kim1995estimating}, second \\Citep{fu2006statistical}'
tfile <- tempfile(fileext = '.bib')
out <- substrBib(bib, txt)


test_that("substrBib", {
  expect_error(substrBib("tmp", txt), 'any(class(bib) %in% c("BibEntry", "bibentry")) is not TRUE', fixed = TRUE)
  expect_equal(length(out), 2)
  expect_equal(gsub(out[1L], pattern='\\D', replace=""), "12006212630")
  expect_equal(gsub(out[2L], pattern='\\D', replace=""), "1319951437144614")
})
