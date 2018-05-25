context("logistic")


test_that("logistic", {
  expect_equal(logistic(-Inf), -1)
  expect_equal(logistic(Inf), 1)
  expect_equal(logistic(0), 0)
})


test_that("logistic2", {
  expect_equal(logistic2(-Inf), -1)
  expect_equal(logistic2(Inf), 1)
  expect_equal(logistic2(0), 0)
  expect_equal(logistic2(0, yzer=.5), 0.5)
})
