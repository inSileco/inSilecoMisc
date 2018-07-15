context("scaleWithin")


set.seed(1012)

val <- runif(1000, 0, 100)
res1 <- scaleWithin(val, 20, 40, 60)


test_that("errors", {
  expect_error(scaleWithin(val, 100, 20, 10))
  expect_error(scaleWithin(val, 100, 20, 20))
  expect_error(scaleWithin(val, 1))
})


test_that("errors", {
  expect_equal(min(res1), 1)
  expect_equal(max(res1), 20)
})
