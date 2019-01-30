context("String length")

res1 <- stLength(123)
res2 <- stLength(c("/", "four"))
res3 <- stLength(c('/', 'four five'), ignore = c(" ", "f"))

test_that("String length", {
  expect_equal(res1, 3)
  expect_true(all(res2, c(1L, 4L)))
  expect_true(all(res2, c(1L, 6L)))
})
