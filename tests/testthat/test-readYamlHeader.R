context("Reading YAML header")


res1 <- readYamlHeader("testdata/yamlheader.md")
out <- list(author = "inSileco")

test_that("getDigits", {
  expect_true(identical(res1, out))
  expect_warning(readYamlHeader("testdata/noyamlheader.md"), "no yaml header detected")
  expect_warning(readYamlHeader("testdata/wrongyamlheader.md"), "something wrong with the yaml header detected")
})
