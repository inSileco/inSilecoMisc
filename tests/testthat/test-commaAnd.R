context("commaAnd")


test_that("commaAnd works", {
  expect_equal(commaAnd(c("J")), "J")
  expect_equal(commaAnd(c("J", "P")), "J and P")
  expect_equal(commaAnd(c("J", "P", "R")), "J, P and R")
  expect_equal(commaAnd(c("J", "P", "R", "M")), "J, P, R and M")
  expect_equal(commaAnd(c("J", "P", "R"), " and ", " and finally "), "J and P and finally R")
})