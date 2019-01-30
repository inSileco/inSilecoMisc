context("Create data frames")

dfA <- data.frame(col1 = c(1, 2), col2 = LETTERS[1:2])
dfB <- data.frame(col1 = 2, col4 = "cool")

df1 <- dfTemplate(2)
df2 <- dfTemplate(2, 2, fill = 0, col_classes = "numeric")
df3 <- dfTemplate(c("value", "name"), 2, col_classes = c("numeric", "character"))

df4 <- dfTemplateMatch(dfA, c("col4"))
df5 <- dfTemplateMatch(dfA, dfB)
df6 <- dfTemplateMatch(dfA, c("col1", "col4"), yonly = TRUE)
df7 <- dfTemplateMatch(dfA, c("col2", "col1"), yonly = TRUE, col_classes = "numeric", fill = 0)

rna <- rep(NA_character_, 2)
rn0 <- rep(0, 2)

test_that("dfTemplate", {
  expect_identical(df1, data.frame(Var1 = NA_character_, Var2 = NA_character_))
  expect_identical(df2, data.frame(Var1 = rn0, Var2 = rn0))
  expect_identical(df3, data.frame(value = as.numeric(rna), name = rna))
})

test_that("dfTemplateMatch", {
  expect_identical(df4, cbind(dfA, col4 = rna))
  expect_identical(df5, df4)
  expect_identical(df6, cbind(dfA[1], col4 = rna))
  expect_identical(df7, dfA)
})
