library(letiRmisc)
context("Makes your matrix square")


res1 <- squaretize(matrix(1:12, 3, 4))
res2 <- squaretize(matrix(1:12, 4, 3))
res3 <- squaretize(matrix(1:12, 3, 4), fill=1:4)
res4 <- squaretize(matrix(1:15, 3, 5, dimnames=list(LETTERS[3:1], LETTERS[1:5])), reorder=FALSE)
res5 <- squaretize(matrix(1:15, 3, 5, dimnames=list(LETTERS[3:1], LETTERS[1:5])))


test_that("squaretize dimensions", {
  expect_equal(dim(res1), c(4,4))
  expect_equal(dim(res2), c(4,4))
  expect_equal(dim(res4), c(5,5))
})

test_that("ckeck filling elements", {
  expect_true(all(res1[4,]==0))
  expect_true(all(res3[4,]==1:4))
})

test_that("ckeck filling elements", {
  expect_false(all(colnames(res4)==rownames(res4)))
  expect_true(all(colnames(res5)==rownames(res5)))
})
