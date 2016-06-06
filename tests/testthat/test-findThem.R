library(letiRmisc)
context("findThem")

string <- unlist(strsplit("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", ""))

res1 <- findThem("x", string)
res2 <- findThem("x", string, todf=TRUE)
res3 <- findThem(c("x","v"), string)
res4 <- findThem(c("y"), string)
res5 <- findThem(c("x","v","y"), string)


test_that("findThem output formats", {
  expect_equal(class(res1), "list")
  expect_equal(class(res2), "data.frame")
})


test_that("findThem output lengths", {
  expect_equal(length(res1), 1)
  expect_equal(ncol(res2), 3)
  expect_equal(nrow(res2), 2)
  expect_equal(length(res3), 2)
})

test_that("findThem output values", {
  expect_equal(res3[[2]], 143)
  expect_equal(length(unlist(res3)), 3)
})


test_that("findThem missings values", {
  expect_equal(res4, NA_integer_)
  expect_true(all(unlist(res3)==unlist(res5)))
})
