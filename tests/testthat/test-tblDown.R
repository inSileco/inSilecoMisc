context("test tblDown")

test_that("errors", {
  expect_error(tblDown(1L), "is.list(x) | is.data.frame(x) is not TRUE",
    fixed = TRUE)
  expect_error(tblDown(list(1L, 2L)),
    "all(unlist(lapply(x, is.data.frame))) is not TRUE", fixed = TRUE)
})


fl0 <- tempfile()
file.create(fl0)
test_that("check file 0", {
    expect_true(file.exists(fl0))
})

fl1 <- tempfile(fileext = ".docx")
fl2 <- tempfile(fileext = ".md")
fl3 <- tempfile(fileext = ".md")

data(CO2)
tblDown(CO2, fl1)
tblDown(list(CO2[1:2, ], CO2[3:6,]), fl2)
tblDown(list(CO2[1:2, ], CO2[3:6,]), fl3, section = "section",
  caption = "CO2", title = "Tables")

test_that("check file creation", {
    expect_true(file.exists(fl1))
    expect_true(file.exists(fl2))
    expect_true(file.exists(fl3))
})

ct_fl2 <- readLines(fl2)
ct_fl3 <- readLines(fl3)

cat("\n")
cat(ct_fl3, sep = "\n")
cat("\n")

test_that("check file content", {
    expect_equal(length(ct_fl2), 11)
    expect_equal(length(ct_fl3), 21)
    expect_equal(sum(grepl("section", ct_fl3)), 2)
    expect_equal(sum("" == ct_fl3), 5)
    expect_equal(sum("" == ct_fl2), 1)
    expect_equal(sum(grepl("Plant", ct_fl3)), sum(grepl("Plant", ct_fl2)))
})

lapply(c(fl1, fl2, fl3), unlink)