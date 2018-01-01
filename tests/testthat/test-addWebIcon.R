library(letiRmisc)
context("add icon")

res1 <- addWebIcon('cc')
res2 <- addWebIcon('cc', 'ai', 3)


test_that("add URL", {
  expect_equal(res1, "<i class=\"fa fa-cc fa-2x\"></i>")
  expect_equal(res2, "<i class=\"ai ai-cc ai-3x\"></i>")
})
