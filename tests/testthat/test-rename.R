context("renaming object")

tb <- data.frame(var1 = 2, var2 = "B")
res1 <- rename(tb, c("var1", "var2"), c("uptake", "type"))
res2 <- rename(tb, c("var"), c("cool"))


test_that("renamed as exected", {
  expect_equal(names(res1), c("uptake", "type"))
  expect_equal(names(res2), names(tb))
  expect_error(rename(tb, "var1", c("up", "take")))
})

