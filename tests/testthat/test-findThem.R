library(letiRmisc)
context("findThem")

string <- unlist(strsplit("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", ""))

mydf <- data.frame(
  var1=string,
  var2=tolower(string)
)

res1 <- findThem("e", string)
res2 <- findThem("e", string, todf=TRUE)
res3 <- findThem("y", string, todf=TRUE)

res1a <- findThem("e", var1, data=mydf)


test_that("findThem formats", {
  expect_equal(class(res1), "list")
  expect_equal(class(res2), "data.frame")
  expect_equal(res3, NA_integer_)
})

test_that("findThem uses dataframes", {
  expect_true(all(res1[[1]]==res1a[[1]]))
})
