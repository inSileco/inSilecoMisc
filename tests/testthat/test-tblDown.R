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
fl2 <- tempfile(fileext = ".docx")
fl3 <- tempfile(fileext = ".docx")
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

lapply(c(fl1, fl2, fl3), unlink)