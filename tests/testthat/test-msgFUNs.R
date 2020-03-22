context("Message")

msg1 <- msgInfo("computing")
msg2 <- msgSuccess("done")
msg3 <- msgError("you got it wrong")
msg4 <- msgWarning("be careful")
msg5 <- msgInfo("computing", "again")

test_that("msgFUNs", {
  expect_equal(msg1, "ℹ computing")
  expect_equal(msg2, "✔ done")
  expect_equal(msg3, "✖ you got it wrong")
  expect_equal(msg4, "⚠ be careful")
  expect_equal(msg5, "ℹ computing again")
})
