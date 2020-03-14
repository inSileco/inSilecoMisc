context("getDigits")

test_that("getDigits", {
  expect_equal(getDigits('a1')[[1L]][1L], "1")
  expect_equal(getDigits('a1?3', collapse='_')[[1L]], "1_3")
  expect_equal(getDigits(c('a1', '?3')), list("1", "3"))
})
