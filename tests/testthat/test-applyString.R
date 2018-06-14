context("Apply a funciton on element of a character string")

res1 <- applyString("cool", FUN = toupper, pos = 1:2)
res2 <- applyString(c("cool", "pro"),  pattern = "o", FUN = toupper)


test_that("test expected behaviour", {
  expect_equal(res1, "COol")
  expect_true(identical(res2, c("cOOl", "prO")))
  expect_warning(applyString("cool", FUN = toupper), "neither pos nor pattern is defined")
})
