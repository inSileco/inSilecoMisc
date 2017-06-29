library(letiRmisc)
context("signifSymbols")


test_that("basic checks", {
  expect_error(signifSymbols(.1,.2))
  expect_error(signifSymbols(.1, thresholds=c(.5)))
  expect_equal(signifSymbols(.011), "*")
  expect_equal(signifSymbols(.11), "n.s.")
})
