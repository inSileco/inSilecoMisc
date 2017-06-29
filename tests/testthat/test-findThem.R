library(letiRmisc)
context("findThem")

string <- unlist(strsplit("Lorem ipsum dolor sit amet", ""))

res1 <- findThem("i", string)
res2 <- findThem("i", string, todf=TRUE)
res3 <- findThem(c("i","p"), string)
res4 <- findThem(c("y"), string)
res5 <- findThem(c("i","p","y"), string)
res6 <- findThem(c("i","y"), string, todf=TRUE, reportnomatch=TRUE)


test_that("findThem output formats", {
  expect_equal(class(res1), "list")
  expect_equal(class(res2), "data.frame")
})

test_that("findThem output lengths", {
  expect_equal(length(res1), 1)
  expect_equal(dim(res2), c(2,3))
  expect_equal(dim(res6), c(3,3))
  expect_equal(length(res3), 2)
})

test_that("findThem output values", {
  expect_equal(res3[[2]], 8)
  expect_equal(length(unlist(res3)), 3)
})

test_that("findThem missings values", {
  expect_equal(res4, NA_integer_)
  expect_true(all(unlist(res3)==unlist(res5)))
})
