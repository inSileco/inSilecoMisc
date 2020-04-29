context("Stopwatch & Timer")

test_that("messages", {
  expect_message(stopwatch(.1))
  expect_message(timer(.1))
})