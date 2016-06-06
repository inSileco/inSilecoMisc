library(letiRmisc)
context("GaussianShape")


test_that("gaussianShape defaults", {
  expect_equal(gaussianShape(0), 1/sqrt(2*pi))
  expect_equal(gaussianShape(1000), 0)
})

test_that("gaussianShape and its optima", {
  expect_equal(gaussianShape(1,1), 1/sqrt(2*pi))
  expect_equal(gaussianShape(1,1,1), 1)
})

test_that("gaussianShape and width", {
  expect_error(gaussianShape(1,1,1,0))
  expect_equal(gaussianShape(1,1,1,1), 1)
})

test_that("gaussianShape and power", {
  expect_equal(gaussianShape(1,1,1,1,1),1)
  expect_equal(gaussianShape(1,1,1,1,-1),0)
  expect_true(gaussianShape(0.9,1,1,1,2)>gaussianShape(0.9,1,1,1,1))
})
