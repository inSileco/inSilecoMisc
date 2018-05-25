context("add URL")

res1 <- addURL("url", "text")
res2 <- addURL("url", "text", markdown=TRUE)
res2b <- addURL("url", markdown=TRUE)
res3 <- addURL("url", "text", extra="target='_blank'")
res4 <- addURL("url", "text", extra='target="_blank"')


test_that("add URL", {
  expect_equal(res1, "<a href='url'>text</a>")
  expect_equal(res2, "[text](url)")
  expect_equal(res2b, "[url](url)")
  expect_equal(res3, "<a href='url' target='_blank'>text</a>")
  expect_equal(res4, "<a href='url' target=\"_blank\">text</a>")
  expect_warning(addURL("url", extra="target='_blank'", markdown=TRUE), "markdown is 'TRUE' so 'extra' is ignored", fixed=TRUE)
})
