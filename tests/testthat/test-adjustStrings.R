context("Adjust your character string")

vec <- "Coucou"
res0 <- adjustStrings(1,0)
res1 <- adjustStrings(1,1)
res2 <- adjustStrings(1,3)
res3 <- adjustStrings(1, 3, 0)
res4 <- adjustStrings("cool", 3)
res5 <- adjustStrings("ol", 4, "co")
res6 <- adjustStrings("ol", 6, "co")
res7 <- adjustStrings("co", 4, "ol", before = FALSE)



test_that("check default behavior", {
  expect_equal(res0, "")
  expect_equal(res1, "1")
  expect_equal(res2, "001")
  expect_equal(res3, "001")
})

test_that("check truncating", {
  expect_equal(res4, "coo")
})

test_that("check extra arguments", {
  expect_equal(res5, "cool")
  expect_equal(res6, "cocool")
})

test_that("check before arguments", {
  expect_equal(res7, "cool")
})

test_that("check result for more than one", {
   expect_identical(adjustStrings(c("cool", "ol"), 4, "co"), rep("cool", 2))
})
