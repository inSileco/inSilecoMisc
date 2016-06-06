library(letiRmisc)
context("findThem")

string <- unlist(strsplit("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", ""))

mydf <- data.frame(
  var1=string,
  var2=tolower(string)
)

res1 <- findThem("e", string)
res2 <- findThem("e", string, todf=TRUE)


test_that("findThem formats", {
  expect_equal(class(res1), "list")
  expect_equal(class(res2), "data.frame")
})
