context("Lorem")


test_that("categorize a numerial vector", {
  expect_equal(wordCount(loremIpsum()), 70)
  expect_equal(wordCount(loremIpsum(10)), 10)
})
