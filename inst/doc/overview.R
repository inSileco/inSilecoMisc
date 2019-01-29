## ----echo=FALSE, message = FALSE-----------------------------------------
knitr::opts_chunk$set(
  comment = "R>> ",
  collapse = TRUE
)
library(inSilecoMisc)

## ----loremIpsum----------------------------------------------------------
loremIpsum()
loremIpsum(10)

## ----keepWords-----------------------------------------------------------
  lor <- loremIpsum()
  keepWords(strex, c(1,4))

## ----strLength-----------------------------------------------------------
  lor <- loremIpsum()
  strLength(lor)
  nchar(lor)
  strLength(lor, ignore = "q")

## ----adjustString--------------------------------------------------------
  paste0('myfilename', adjustString(c(1:2,10,100), 3))

## ----signifSymbols-------------------------------------------------------
  sapply(c(.2, .08, .04, .008, 0.0001), signifSymbols)

## ----addURL--------------------------------------------------------------
addURL("https://github.com/inSileco/letiRmisc", "Github repo")
addURL("https://github.com/inSileco/letiRmisc", "Github repo", markdown=TRUE)

## ----addWebIcon----------------------------------------------------------
addWebIcon('cc')
addWebIcon('acm', 'ai', 4)

## ----applyString---------------------------------------------------------
applyString("cool", FUN = toupper, pos = 1:2)
applyString(c("cool", "pro"),  pattern = "o", FUN = toupper)

## ----getDigits-----------------------------------------------------------
getDigits(c("a1", "032hdje2832"))

## ----whichIs-------------------------------------------------------------
vec <- LETTERS[1:7]
spl <- sample(vec)
whichIs(vec, spl)
id <- unlist(whichIs(vec, spl))
spl[id]

## ----meanAlong-----------------------------------------------------------
meanAlong(1:10, 2)

## ----scaleWithin---------------------------------------------------------
val <- runif(1000, 0, 100)
res1 <- scaleWithin(val, 20, 40, 60)

## ----categorize----------------------------------------------------------
  (seqv <- stats::runif(40))
  categorize(seqv, categ=seq(0.1,0.9, 0.1))

## ----squaretize----------------------------------------------------------
  mat <- matrix(1:15, 3, 5, dimnames=list(LETTERS[3:1], LETTERS[1:5]))
  print(mat)
  squaretize(mat, reorder=FALSE)

## ----setColClass---------------------------------------------------------
  df1 <- matrix(signif(runif(20),4), ncol=2)
  df2 <- setColClass(df1, 2, 'character')
  str(df1)
  str(df2)

## ------------------------------------------------------------------------
findRef(text='First \\cite{Pimm2000}, second \\Citep{May1972}')

## ------------------------------------------------------------------------
findRef(text='First @Pimm2000, second @May1972, third [@May1972]', markdown=TRUE)

## ----extractBiblio-------------------------------------------------------
file.name <- system.file('Bib', 'RJC.bib', package='RefManageR')
bib <- RefManageR::ReadBib(file.name)
txt <- 'First \\cite{kim1995estimating}, second \\Citep{fu2006statistical}'
tfile <- tempfile(fileext = '.bib')
out <- substrBib(bib, txt)
(out)

## ----packagesUse---------------------------------------------------------
packagesUsed(c('utils', 'methods'))

