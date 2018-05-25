context("Test meanAlong")
##
res1 <- meanAlong(1:3, 2)
res2 <- meanAlong(1:4, 2)

test_that("meanAlong", {
  expect_error(meanAlong(1:3, 4), 'length(vec) >= n is not TRUE', fixed = TRUE)
  expect_true(all(res1 == c(1.5, 2.5)))
  expect_true(all(res2 == c(1.5, 2.5, 3.5)))
})
