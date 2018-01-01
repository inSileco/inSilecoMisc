library(letiRmisc)

context("getDigits")


test_that("getDigits", {
  expect_equal(getDigits('a1')[[1L]][1L], "1")
  expect_equal(getDigits('a1?3', collapse='_')[[1L]], "1_3")
})
