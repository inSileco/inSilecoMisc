library(letiRmisc)
context("Aggregate Column")

mat2 <- mat1 <- matrix(rep(1:50,2),10)
mat2[1,1] <- NA

grp1 <- rep(0, 10)
res1 <- aggregateCol(mat1, grp1)

grp2 <- rep(NA, 10)
res2 <- aggregateCol(mat1, grp2)

grp3 <- rep(1:2, each=5)
res3 <- aggregateCol(mat1, grp3)
nms <- c("sum1", "sum2")
res4 <- aggregateCol(mat1, grp3, names_aggreg=nms)

res5 <- aggregateCol(mat2, grp3)
res6 <- aggregateCol(mat2, grp3, FUN=sum, na.rm=TRUE)


test_that("findThem output lengths", {
  expect_true(is.data.frame(res1))
  expect_true(all(res1==mat1))
  expect_equal(nrow(res2), 10)
  expect_equal(ncol(res2), 0)
})


test_that("findThem output values", {
  expect_equal(ncol(res3), 2)
  expect_true(all(res3[,1]==res3[,2]))
  expect_true(identical(names(res4),nms))
})

test_that("findThem and functions", {
  expect_true(is.na(res5[1,1]))
  expect_equal(res6[1,1], res6[1,2]-1)
})
