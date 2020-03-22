context("Message")

msg1 <- msgInfo("computing")
msg2 <- msgSuccess("done")
msg3 <- msgError("you got it wrong")
msg4 <- msgWarning("be careful")
msg5 <- msgInfo("computing", "again")

test_that("msgFUNs", {
  expect_equal(msg1, "\u2139 computing")
  expect_equal(msg2, "\u2714 done")
  expect_equal(msg3, "\u2716 you got it wrong")
  expect_equal(msg4, "\u26a0 be careful")
  expect_equal(msg5, "\u2139 computing again")
})

