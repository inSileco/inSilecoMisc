library(letiRmisc)
context("Test substrBib")
####
file.name <- system.file('Bib', 'RJC.bib', package='RefManageR')
bib <- RefManageR::ReadBib(file.name)
tfile <- tempfile(fileext='.md')
tfile2 <- tempfile(fileext='.tex')
####
txt <- 'First \\cite{kim1995estimating}, second \\Citep{fu2006statistical}'
txtmd <- 'First @Pimm2000, second @May1972, third [@May1972]'
cat(txtmd, sep='\n', file=tfile)
cat(txt, sep='\n', file=tfile2)
####
out <- substrBib(bib, txt)
out2 <- substrBib(bib, con = tfile2)
res <- findRef(text='First \\cite{Pimm2000}, second \\Citep{May1972}')
res2 <- findRef(text=txtmd, markdown=TRUE)
res3 <- findRef(con=tfile, markdown=TRUE)

test_that("substrBib", {
  expect_error(substrBib("tmp"), 'any(class(bib) %in% c("BibEntry", "bibentry")) is not TRUE', fixed = TRUE)
  expect_error(substrBib(bib), "Either 'text' or 'con' must be specified.")
  expect_warning(substrBib(bib, "no ref"))
  expect_equal(length(out), 2)
  expect_equal(gsub(out[1L], pattern='\\D', replace=""), "12006212630")
  expect_equal(gsub(out[2L], pattern='\\D', replace=""), "1319951437144614")
  expect_equal(gsub(out2[1L], pattern='\\D', replace=""), "12006212630")
  expect_equal(gsub(out2[2L], pattern='\\D', replace=""), "1319951437144614")
})


test_that("findRef", {
  expect_error(findRef(), "Either 'text' or 'con' must be specified.", fixed = TRUE)
  expect_true(all(res$key == c("May1972", "Pimm2000")))
  expect_true(all(res2$key == c("May1972", "Pimm2000")))
  expect_true(all(res$freq == c(1,1)))
  expect_true(all(res2$freq == c(2,1)))
  expect_true(all(res2==res3))
})
