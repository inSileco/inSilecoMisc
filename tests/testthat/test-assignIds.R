context("assignIDs")

ls1 <- list(2,'f', 'd', 'f')

test_that("simple checkings", {
  expect_equal(assignIds(ls1), c(1,2,3,2))
  expect_equal(assignIds(ls1, alphabetical=TRUE), c(1,3,2,3))
})
