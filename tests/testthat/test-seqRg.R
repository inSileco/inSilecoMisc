context("seqRg")

test_that("check seqRg", {
  expect_equal(seqRg(1:10, 10), seq_len(10))
  expect_equal(seqRg(0:10, 21, .5), -5:15)
  expect_equal(seqRg(0:10, 10, -.5), rep(5, 10))
  expect_equal(seqRg(0:10, 11, -1), 10:0)
  expect_equal(seqRg(0:10, 13, 1, prop = FALSE), -1:11)
})

test_that("check seqCol and seqRow", {
  expect_equal(seqCol(matrix(1, 2, 3)), seq_len(3))
  expect_equal(seqRow(matrix(1, 2, 3)), seq_len(2))
  expect_equal(seqCol(NULL), 1)
  expect_equal(seqRow(NULL), integer(0))
})


