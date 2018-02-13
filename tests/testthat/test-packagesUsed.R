library(letiRmisc)
context("packageUsed")

nm <-c("utils", "methods")
res <- packagesUsed(nm)


test_that("used package", {
  expect_error(packagesUsed("method"))
  expect_true(all(res$name == nm))
})
