library(letiRmisc)
context("Duplicate rows and columns")

mydf <- data.frame(
  var1=1:10,
  var2=LETTERS[1:10],
  var3=LETTERS[1:10]
)

mydf$var2 <- as.factor(mydf$var2)
mydf$var3 <- as.character(mydf$var3)

mydf1a <- duplicateRow(mydf)
mydf1b <- duplicateCol(mydf)

mydf2a <- duplicateRow(mydf, id.el=11)

mydf3a <- duplicateRow(mydf, id.el=c(2,6), times=c(1,2))
mydf3b <- duplicateCol(mydf, id.el=c(2,3), times=c(1,2))
#
mydf4a <- duplicateRow(mydf, append = TRUE)
mydf4b <- duplicateCol(mydf, append = TRUE)


test_that("duplicates by default", {
  expect_equal(nrow(mydf1a), nrow(mydf)+1)
  expect_equal(all(mydf1a[1,]==mydf1a[2,]), TRUE)
  expect_equal(ncol(mydf1b), ncol(mydf)+1)
})

test_that("duplicates missings", {
  expect_equal(mydf2a[11,1], NA_integer_)
  expect_equal(as.numeric(mydf2a[11,2]), NA_integer_)
  expect_equal(mydf2a[11,3], NA_character_)
  expect_error(duplicateCol(mydf, id.el=4))
})

test_that("duplicates multi elements", {
  expect_equal(nrow(mydf3a), nrow(mydf)+3)
  expect_equal(ncol(mydf3b), ncol(mydf)+3)
})

test_that("duplicates and appends", {
  expect_equal(nrow(mydf4a), nrow(mydf)+1)
  expect_equal(ncol(mydf4b), ncol(mydf)+1)
  expect_equal(all(mydf4a[1,]==mydf4a[11,]), TRUE)
  expect_equal(all(mydf4b[,1]==mydf4b[,4]), TRUE)
})
