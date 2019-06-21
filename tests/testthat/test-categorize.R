context("Categorize")

seq1 <- 0:9
##
res1a <- rep(1:2, times=c(5,5))
res1b <- rep(1:2, c(6,4))
##
res2a <- rep(1:2, times=c(2,8))
res2b <- rep(1:2, times=c(3,7))
##

test_that("categorize a numerial vector", {
  expect_equal(categorize(seq1, 5), res1a)
  expect_equal(categorize(seq1, 5, lower = TRUE), res1b)
})

test_that("categorize a character vector", {
  expect_equal(categorize(LETTERS[1:10], "C"), res2a)
  expect_equal(categorize(LETTERS[1:10], "C", lower = TRUE), res2b)
})

test_that("handling NAs", {
  expect_equal(categorize(c(1,NA,3), 2), c(1, NA, 2))
})
