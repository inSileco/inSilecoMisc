context("LoremIpsum()")


test_that("categorize a numerial vector", {
  expect_equal(wordCount(loremIpsum()), 201)
  expect_equal(wordCount(loremIpsum(12)), 12)
  expect_equal(wordCount(loremIpsum(220)), 220)
})
