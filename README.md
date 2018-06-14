letiRmisc
=========

[![Build
Status](https://travis-ci.org/inSileco/inSilecoMisc.svg?branch=master)](https://travis-ci.org/inSileco/inSilecoMisc)
[![Build
status](https://ci.appveyor.com/api/projects/status/rskiyadk6urmsrox/branch/master?svg=true)](https://ci.appveyor.com/project/KevCaz/insilecomisc/branch/master)
[![codecov](https://codecov.io/gh/inSileco/inSilecoMisc/branch/master/graph/badge.svg)](https://codecov.io/gh/inSileco/inSilecoMisc)

About
-----

### Description

The *inSilecoMisc* package is a set of useful R functions created to
ease some operations we often do. Functions here are written to be used
with base may already be available in other packages (especially in
packages of the [tidyverse](https://www.tidyverse.org/)).

So far, we do not intend to release this package on the CRAN. If you
however find one of these function and intend to use it in your own
package, please, help yourself!

Note that functions’ names are written using Camel case (*e.g.*
`keepWords()`).

Installation
------------

To get the current development version from Github, use the
[*devtools*](http://cran.r-project.org/web/packages/devtools/index.html)
package like so:

    if (!require("devtools")) install.packages("devtools")
    devtools::install_github("inSileco/inSilecoMisc")

Main features
-------------

    library(inSilecoMisc)

### Keep a selection of words

      strex <- 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
      keepWords(strex, c(1,4))
    R>>  [[1]]
    R>>  [1] "Lorem" "sit"

### Size of a string

      strLength(strex)
    R>>  [1] 57

### Assign a category

      (seqv <- stats::runif(40))
    R>>   [1] 0.74583000 0.45982127 0.62770412 0.33520836 0.54600437 0.54235708
    R>>   [7] 0.19201931 0.61752738 0.23692015 0.93438982 0.09256918 0.51994010
    R>>  [13] 0.23141000 0.48902149 0.71794182 0.75709344 0.78120820 0.10739735
    R>>  [19] 0.48477491 0.98179428 0.04187389 0.95140570 0.04183031 0.20373064
    R>>  [25] 0.65792612 0.32944390 0.72273830 0.95339114 0.85410125 0.88290747
    R>>  [31] 0.42690014 0.66485737 0.96752513 0.17307674 0.33680796 0.53614862
    R>>  [37] 0.16113397 0.68283502 0.39706541 0.68591929
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    R>>   [1]  8  5  7  4  6  6  2  7  3 10  1  6  3  5  8  8  8  2  5 10  1 10  1
    R>>  [24]  3  7  4  8 10  9  9  5  7 10  2  4  6  2  7  4  7

### Turn a matrix or a data frame into a squared matrix

      mat <- matrix(1:15, 3, 5, dimnames=list(LETTERS[3:1], LETTERS[1:5]))
      print(mat)
    R>>    A B C  D  E
    R>>  C 1 4 7 10 13
    R>>  B 2 5 8 11 14
    R>>  A 3 6 9 12 15
      squaretize(mat, reorder=FALSE)
    R>>    A B C  D  E
    R>>  C 1 4 7 10 13
    R>>  B 2 5 8 11 14
    R>>  A 3 6 9 12 15
    R>>  D 0 0 0  0  0
    R>>  E 0 0 0  0  0

### Adjust the size of a character string

      paste0('myfilename', adjustString(c(1:2,10,100), 3))
    R>>  [1] "myfilename001" "myfilename002" "myfilename010" "myfilename100"

### Assign classes to data frames’ columns

      df1 <- matrix(signif(runif(20),4), ncol=2)
      df2 <- assignClass2df(df1, 2, 'character')
      str(df1)
    R>>   num [1:10, 1:2] 0.64 0.5804 0.4792 0.3625 0.0265 ...
      str(df2)
    R>>  'data.frame':  10 obs. of  2 variables:
    R>>   $ V1: num  0.64 0.5804 0.4792 0.3625 0.0265 ...
    R>>   $ V2: chr  "0.8075" "0.3106" "0.7541" "0.4842" ...

### Assign a symbol to a p-value

      sapply(c(.2, .08, .04, .008, 0.0001), signifSymbols)
    R>>  [1] "n.s." "."    "*"    "**"   "***"

### Find reference and extract bibliography

    findRef(text='First \\cite{Pimm2000}, second \\Citep{May1972}')
    R>>         key freq
    R>>  1  May1972    1
    R>>  2 Pimm2000    1

    findRef(text='First @Pimm2000, second @May1972, third [@May1972]', markdown=TRUE)
    R>>         key freq
    R>>  1  May1972    2
    R>>  2 Pimm2000    1

    file.name <- system.file('Bib', 'RJC.bib', package='RefManageR')
    bib <- RefManageR::ReadBib(file.name)
    txt <- 'First \\cite{kim1995estimating}, second \\Citep{fu2006statistical}'
    tfile <- tempfile(fileext = '.bib')
    out <- substrBib(bib, txt)
    (out)
    R>>  [1] W. J. Fu, J. Hu, T. Spencer, et al. "Statistical models in
    R>>  assessing fold change of gene expression in real-time RT-PCR
    R>>  experiments". In: _Computational biology and chemistry_ 30.1
    R>>  (2006), pp. 21-26.
    R>>  
    R>>  [2] M. Y. Kim, B. S. Pasternack, R. J. Carroll, et al. "Estimating
    R>>  the reliability of an exposure variable in the presence of
    R>>  confounders". In: _Statistics in medicine_ 14.13 (1995), pp.
    R>>  1437-1446.

### Add URL and icons

    addURL("https://github.com/inSileco/letiRmisc", "Github repo")
    R>>  [1] "<a href='https://github.com/inSileco/letiRmisc'>Github repo</a>"
    addURL("https://github.com/inSileco/letiRmisc", "Github repo", markdown=TRUE)
    R>>  [1] "[Github repo](https://github.com/inSileco/letiRmisc)"

    addWebIcon('cc')
    R>>  [1] "<i class=\"fa fa-cc fa-2x\"></i>"
    addWebIcon('acm', 'ai', 4)
    R>>  [1] "<i class=\"ai ai-acm ai-4x\"></i>"

applyString
-----------

    applyString("cool", FUN = toupper, pos = 1:2)
    R>>  [1] "COol"
    applyString(c("cool", "pro"),  pattern = "o", FUN = toupper)
    R>>  [1] "cOOl" "prO"

meanAlong
---------

    meanAlong(1:10, 2)
    R>>  [1] 1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5

packagesUsed
------------

    packagesUsed(c('utils', 'methods'))
    R>>       name version
    R>>  1   utils   3.5.0
    R>>  2 methods   3.5.0

Tout-doux list
--------------

-   \[ \] inSilecico member, a short but useful function you often use?
    Add it in this repo :stuck\_out\_tongue\_winking\_eye:;

<!-- pkg <- pkgdown:::section_init(".", depth = 0, override = list())
pkg2 <- pkgdown:::as_pkgdown(".")
format <- pkgdown:::build_rmarkdown_format(pkg2, depth = 0L, data = list(), toc = FALSE)
pkgdown:::render_rmarkdown(pkg = pkg2, input =  pkg$dst_path, output = "index.html",
       output_format = format, quiet = F, copy_images = FALSE)
pkgdown::build_site() -->
