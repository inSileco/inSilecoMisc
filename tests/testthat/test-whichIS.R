context("whichIs")


## Test whichIs by using it to sort a vector after sampling
vec <- LETTERS[1:7]
spl <- sample(vec)
id <- unlist(whichIs(vec, spl))
id2 <- unlist(whichIs(vec, "K"))
spl2 <- paste0(spl, "K")
id3 <- unlist(whichIs(vec, spl2, isPattern = TRUE))

test_that("whichIs behavior", {
  expect_identical(vec, spl[id])
  expect_equal(length(id2), 0)
  expect_identical(id, id3)
})
