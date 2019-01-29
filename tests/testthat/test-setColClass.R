context("setColClass")

mat1 <- matrix(signif(runif(20),4), ncol=2)
res1 <- setColClass(mat1, 2, "character")


test_that("checking class", {
  expect_equal(class(res1[,1L]), "numeric")
  expect_equal(class(res1[,2L]), "character")
  expect_error(setColClass(mat1, 3, "character"))
})
