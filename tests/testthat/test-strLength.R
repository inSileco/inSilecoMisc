library(letiRmisc)
context("String length")

res1 <- strLength(123)
res2 <- strLength(c("/", "four"))

test_that("String length", {
  expect_equal(res1, 3)
  expect_true(all(res2, c(1L,4L)))
})
