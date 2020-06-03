context("Create data frames")

dfA <- data.frame(col1 = c(1, 2), col2 = LETTERS[1:2])
dfB <- data.frame(col1 = 2, col4 = "cool")

df1 <- dfTemplate(2)
df2 <- dfTemplate(2, 2, fill = c(0,1), col_classes = "numeric")
df3 <- dfTemplate(c("value", "name"), 2, col_classes = c("numeric", "character"))

df4 <- dfTemplateMatch(dfA, c("col4"))
df5 <- dfTemplateMatch(dfA, dfB)
df6 <- dfTemplateMatch(dfA, c("col1", "col4"), yonly = TRUE)
df7 <- dfTemplateMatch(dfA, c("col2", "col1"), yonly = TRUE, col_classes = "numeric", fill = 0)
df8 <- dfTemplateMatch(dfA, c("col2", "col1"), order = TRUE)

rna <- rep(NA, 2)

test_that("dfTemplate", {
  expect_identical(df1, data.frame(Var1 = NA, Var2 = NA))
  expect_identical(df2, data.frame(Var1 = rep(0, 2), Var2 = rep(1, 2)))
  expect_identical(df3, data.frame(value = as.numeric(rna), name = as.character(rna)))
  expect_error(dfTemplate(2, col_classes = c("numeric", "list")))
})

test_that("dfTemplateMatch", {
  expect_identical(df4, cbind(dfA, col4 = rna))
  expect_identical(df5, df4)
  expect_identical(df6, cbind(dfA[1], col4 = rna))
  expect_identical(df7, dfA)
  expect_identical(df8, dfA[2:1])
})
