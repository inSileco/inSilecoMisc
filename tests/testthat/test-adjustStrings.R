context("Adjust your character string")

vec <- "Coucou"
res0 <- adjustStrings(1,0)
res1 <- adjustStrings(1,1)
res2 <- adjustStrings(1,3)
res3 <- adjustStrings(1, 3, 0)
res4 <- adjustStrings("cool", 3)
res5 <- adjustStrings("ol", 4, "co")
res6 <- adjustStrings("ol", 6, "co")
res7 <- adjustStrings("co", 4, "ol", align = "left")
res8 <- adjustStrings("co", 4, "ol", align = "center")

res9a <- adjustStrings("cool", 1, "#", add = TRUE)
res9b <- adjustStrings("cool", 1, "#", "left", add = TRUE)
res9c <- adjustStrings("cool", 1, "#", "center", add = TRUE)
res9d <- adjustStrings("cool", 3, "#", "center", add = TRUE)


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
  expect_equal(res8, "ocol")
})

test_that("check result for more than one", {
   expect_identical(adjustStrings(c("cool", "ol"), 4, "co"), rep("cool", 2))
})


test_that("check add", {
  expect_equal(res9a, "#cool")
  expect_equal(res9b, "cool#")
  expect_equal(res9c, res9a)
  expect_equal(res9d, "##cool#")
})
