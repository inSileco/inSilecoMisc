context("logit")


test_that("basic errors", {
  expect_warning(logit("cool"))
  expect_equal(logit(.5), 0)
  expect_equal(length(logit(runif(10))), 10)
  expect_equal(logit(0, inv=TRUE), .5)
})
