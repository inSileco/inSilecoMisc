library(letiRmisc)

context("getDigits")


test_that("getDigits", {
  expect_equal(getDigits('c2')[[1]][1], "2")
})
