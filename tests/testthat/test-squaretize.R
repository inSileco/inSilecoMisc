context("Makes your matrix square")

res1 <- squaretize(matrix(1:12, 3, 4))
res2 <- squaretize(matrix(1:12, 4, 3))
res3 <- squaretize(matrix(1:12, 3, 4), fill=1:4)
res4 <- squaretize(matrix(1:15, 3, 5, dimnames=list(LETTERS[3:1], LETTERS[1:5])), reorder=FALSE)
res5 <- squaretize(matrix(1:15, 3, 5, dimnames=list(LETTERS[3:1], LETTERS[1:5])))
res6 <- squaretize(matrix(1:15, 3, 5, dimnames=list(LETTERS[1:3], LETTERS[4:8])))
res7 <- squaretize(matrix(1:15, 3, 5, dimnames=list(LETTERS[1:3])))
res8 <- squaretize(matrix(1:15, 5, 3, dimnames=list(NULL, LETTERS[1:3])))

test_that("squaretize dimensions", {
  expect_equal(dim(res1), c(4,4))
  expect_equal(dim(res2), c(4,4))
  expect_equal(dim(res4), c(5,5))
  expect_equal(dim(res6), c(3+5,3+5))
})

test_that("ckeck filling elements", {
  expect_true(all(res1[4,]==0))
  expect_true(all(res3[4,]==1:4))
})

test_that("ckeck filling elements", {
  expect_false(all(colnames(res4)==rownames(res4)))
  expect_true(all(colnames(res5)==rownames(res5)))
  expect_true(all(colnames(res6)==rownames(res6)))
})

test_that("add row or column names", {
  expect_true(all(rownames(res7)==c(LETTERS[1:3],"X4", "X5")))
  expect_true(all(colnames(res8)==c(LETTERS[1:3],"X4", "X5")))
})
