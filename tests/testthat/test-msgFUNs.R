context("Message")

msg1 <- msgInfo("computing")
msg2 <- msgSuccess("done")
msg3 <- msgError("you got it wrong")
msg4 <- msgWarning("be careful")
msg5 <- msgInfo("computing", "again")

test_that("msgFUNs", {
  expect_equal(stringi::stri_enc_toascii(msg1),
    stringi::stri_enc_toascii("ℹ computing"))
  expect_equal(stringi::stri_enc_toascii(msg2),
    stringi::stri_enc_toascii("✔ done"))
  expect_equal(stringi::stri_enc_toascii(msg3),
    stringi::stri_enc_toascii("✖ you got it wrong"))
  expect_equal(stringi::stri_enc_toascii(msg4),
    stringi::stri_enc_toascii("⚠ be careful"))
  expect_equal(stringi::stri_enc_toascii(msg5),
    stringi::stri_enc_toascii("ℹ computing again"))
})
