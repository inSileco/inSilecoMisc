context("findReplace")

vec <- c("fish", "crab", "crabs", "bug", "crab")
res1 <- findReplace(vec, "crab", "fish")
res2 <- findReplace(vec, c("crab", "crabs"), "fish")
res3 <- grepReplace(vec, "crab[s]?", "fish")



test_that("findReplace", {
  expect_true(all(res1 == c("fish", "fish", "crabs", "bug", "fish")))
  expect_true(all(res2 == c("fish", "fish", "fish", "bug", "fish")))
  expect_true(all(res3 == c("fish", "fish", "fish", "bug", "fish")))
})
