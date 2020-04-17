context("seqRg")

test_that("check default behavior", {
  expect_equal(seqRg(1:10, 10), seq_len(10))
  expect_equal(seqRg(0:10, 21, .5), -5:15)
  expect_equal(seqRg(0:10, 10, -.5), rep(5, 10))
  expect_equal(seqRg(0:10, 11, -1), 10:0)
  expect_equal(seqRg(0:10, 13, 1, prop = FALSE), -1:11)
})