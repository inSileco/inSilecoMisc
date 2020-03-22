context("KeepFUNs")

str1 <- "Lorem ipsum dolor sit amet,\n consectetur"
str2 <- "consectetur adipisicing elit."

res1 <- keepWords(str1)
res2 <- keepWords(str1, collapse = NULL)
res3a <- keepWords(c(str1, str2), slc = c(1, 3))
res3b <- keepWords(c(str1, str2), slc = c(1, 3), collapse = NULL)
res3c <- keepWords(c(str1, str2), slc = c(1, 3), collapse = ", ")
res4a <- keepWords(c(str1, str2), slc = c(1, 4))
res4b <- keepWords(c(str1, str2), slc = c(1, 4), na.rm = TRUE)
res5a <- keepWords(str1, slc = 6)
res5b <- keepWords(str1, slc = 6, split_words = "[[:punct:] ]")

test_that("keepWords()", {
  expect_equal(typeof(res1), "character")
  expect_equal(typeof(res2), "list")
  expect_equal(typeof(res3a), "character")
  expect_equal(typeof(res3b), "list")
  expect_identical(res3a, c("Lorem dolor", "consectetur elit"))
  expect_identical(res3c, c("Lorem, dolor", "consectetur, elit"))
  expect_identical(res4a, c("Lorem sit", "consectetur NA"))
  expect_identical(res4b, c("Lorem sit", "consectetur"))
  expect_identical(res5a, "consectetur")
  expect_identical(res5b, "\n")
})

test_that("wordCount()", {
  expect_equal(wordCount(c("two words!", "... and three words")), c(2, 3))
  expect_equal(wordCount(".#\n.. "), 0)
})



res1 <- keepLetters(str1, c(1,5,6))
res2 <- keepLetters(str1, c(1,5,6), collapse = NULL)
res3 <- keepLetters(c(str1, str2))

test_that("keepLetters()", {
  expect_equal(keepLetters(str1), "L")
  expect_equal(keepLetters(str1, c(1,5,6)), "Lmi")
  expect_equal(res2, strsplit(res1, ""))
  expect_identical(res3, c("L", "c"))
  expect_equal(keepLetters(str1, 100), "NA")
  expect_equal(keepLetters(str1, 100, na.rm = TRUE), "")
})


res1 <- keepInitials("National Basketball Association")
res2 <- keepInitials("National Basketball Association", collapse = NULL)
res3 <- keepInitials("National Basketball Association", collapse = "-")
res4 <- keepInitials(c("National Basketball Association", "Creative commons"))

test_that("keepsInitials()", {
  expect_equal(res1, "NBA")
  expect_equal(res2, strsplit(res1, ""))
  expect_equal(res3, "N-B-A")
  expect_equal(res4, c("NBA", "Cc"))
})