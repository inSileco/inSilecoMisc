context("File infos")

getExtension("path1/path2/foo.R")
getFilename("path1/path2/foo.R")
getBasename("path1/path2/foo.R")
getLocation("path1/path2/foo.R")
getDetails("path1/path2/foo.R")
getDetails(list.files(recursive = TRUE)) 
getExtension("foo.R")
getExtension("foo2%?.m4a!")
getBasename("foo2%?.m4a!")

test_that("categorize a numerial vector", {
  expect_identical(getExtension("foo2%?.m4a!"), "m4a!")
  expect_identical(getBasename("foo2%?.m4a!"), "foo2%?")
  expect_identical(getBasename("foo2%?"), "foo2%?")
  expect_true(is.na(getExtension("foo2%?.m4a!:")))
  
  expect_identical(getFilename("path1/path2/foo.R"), "foo.R")
  expect_true(is.na(getExtension("foo")))
  
  expect_identical(getLocation("path1/path2/foo.R"), "path1/path2")
  expect_identical(getLocation("foo.R"), ".")

  expect_identical(getName("path1/path2/foo.R"), "foo.R")
  expect_identical(getName("path1/path2/foo"), "foo")
  
  res <- getDetails(list.files("testdata", pattern = "^test", full.names = TRUE))
  expect_equal(dim(res), c(2, 5))
  expect_equal(sum(res$Directory), 1)
})
