context("Message")

msg1 <- msgInfo("computing")
msg2 <- msgSuccess("done")
msg3 <- msgError("you got it wrong")
msg4 <- msgWarning("be careful")
msg5 <- msgInfo("computing", "again")

test_that("msgFUNs", {
  expect_equal(msg1, paste(cli::symbol$info, "computing"))
  expect_equal(msg2, paste(cli::symbol$tick, "done"))
  expect_equal(msg3, paste(cli::symbol$cross, "you got it wrong"))
  expect_equal(msg4, paste(cli::symbol$warning, "be careful"))
  expect_equal(msg5, paste(cli::symbol$info, "computing again"))
})
