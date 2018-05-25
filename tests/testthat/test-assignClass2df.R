context("assignClass2df")

mat1 <- matrix(signif(runif(20),4), ncol=2)
res1 <- assignClass2df(mat1, 2, "character")


test_that("checking class", {
  expect_equal(class(res1[,1]), "numeric")
  expect_equal(class(res1[,2]), "character")
  expect_error(assignClass2df(mat1, 3, "character"))
})
