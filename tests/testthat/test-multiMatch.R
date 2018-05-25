context("Test multiMatch")


res1 <- multiMatch('A first ref @Cool and a second @Sweet', '@[[:alnum:]]+')
res2 <- multiMatch('A first ref @Cool and a second @Sweet', '&[[:alnum:]]+')


test_that("mutiMatch", {
  expect_true(all(res1 == c('@Cool', "@Sweet")))
  expect_equal(length(res2), 0)
})
