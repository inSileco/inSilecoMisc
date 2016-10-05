library(letiRmisc)
context("Adjust your string")

vec <- "Coucou"
res0 <- adjustString(1,0)
res1 <- adjustString(1,1)
res2 <- adjustString(1,3)
res3 <- adjustString(1,-3,0)
res4 <- adjustString("cool",3)
res5 <- adjustString("ol", 4, "co")
res6 <- adjustString("ol", 6, "co")
res7 <- adjustString("co", 4, "ol", before=FALSE)



test_that("check default fonctionning", {
  expect_equal(res0, "")
  expect_equal(res1, "1")
  expect_equal(res2, "001")
  expect_equal(res3, "001")
})

test_that("check truncating", {
  expect_equal(res4, "coo")
})

test_that("check extra arguments", {
  expect_equal(res5, "cool")
  expect_equal(res6, "cocool")
})

test_that("check before arguments", {
  expect_equal(res7, "cool")
})
