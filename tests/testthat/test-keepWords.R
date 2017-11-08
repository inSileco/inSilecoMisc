library(letiRmisc)
context("Keeps and counts words")

str.test1 <- "Lorem ipsum dolor sit amet,"
str.test2 <- "consectetur adipisicing elit."

test_that("keepWords typeof", {
  expect_equal(typeof(keepWords(str.test1)), "list")
})

res1a <- keepWords(str.test1)[[1]]
res1b <- keepWords(str.test1, slc = 5)[[1]]
test_that("keepWords one word", {
  expect_equal(res1a, "Lorem")
  expect_equal(res1b, "amet")
})

res2a <- keepWords(str.test1, punct.rm = FALSE)[[1]]
res2b <- keepWords(str.test1, punct.rm = FALSE, slc = 5)[[1]]
test_that("keepWords keeps punctuation", {
  expect_equal(res2a, "Lorem")
  expect_equal(res2b, "amet,")
})

test_that("keepWords of missings", {
  expect_equal(keepWords("")[[1]], NA_character_)
  expect_equal(keepWords(str.test1,6)[[1]],  NA_character_)
  expect_equal(length(keepWords("", na.rm=T)[[1]]), 0)
})

test_that("keepWords collapses", {
  expect_equal(keepWords(str.test1, c(1,5), collapse="-")[[1]], "Lorem-amet")
})

res <- keepWords(c(str.test1,str.test2))
test_that("keepWords for multi strings", {
  expect_equal(length(res), 2)
  expect_equal(length(res[[1]]), 1)
  expect_equal(length(res[[2]]), 1)
})




##--

test_that("count words", {
  expect_equal(wordCount(str.test1), 5)
  expect_true(all(wordCount(c(str.test1, str.test2)) == c(5,3)))
})
