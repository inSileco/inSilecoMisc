letiRmisc
=========

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

### Current status

[![Build
Status](https://travis-ci.org/inSileco/inSilecoMisc.svg?branch=master)](https://travis-ci.org/inSileco/inSilecoMisc)
[![Build
status](https://ci.appveyor.com/api/projects/status/rskiyadk6urmsrox/branch/master?svg=true)](https://ci.appveyor.com/project/KevCaz/insilecomisc/branch/master)
[![codecov](https://codecov.io/gh/inSileco/inSilecoMisc/branch/master/graph/badge.svg)](https://codecov.io/gh/inSileco/inSilecoMisc)

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
    R>>   [1] 0.99214337 0.31171799 0.56070470 0.54466872 0.29966394 0.32109119
    R>>   [7] 0.28128818 0.59589856 0.81216719 0.29817815 0.26570390 0.67276404
    R>>  [13] 0.94476824 0.36332951 0.92936313 0.23618996 0.50067110 0.29241868
    R>>  [19] 0.21714723 0.44384743 0.22142397 0.77767900 0.67439501 0.45173673
    R>>  [25] 0.27326727 0.66848496 0.80267346 0.56277968 0.96802984 0.10215451
    R>>  [31] 0.56928679 0.97048877 0.43552671 0.09509066 0.67638032 0.06425101
    R>>  [37] 0.06244420 0.55870936 0.60233759 0.32699378
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    R>>   [1] 10  4  6  6  3  4  3  6  9  3  3  7 10  4 10  3  6  3  3  5  3  8  7
    R>>  [24]  5  3  7  9  6 10  2  6 10  5  1  7  1  1  6  7  4

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
    R>>   num [1:10, 1:2] 0.341 0.786 0.639 0.343 0.919 ...
      str(df2)
    R>>  'data.frame':  10 obs. of  2 variables:
    R>>   $ V1: num  0.341 0.786 0.639 0.343 0.919 ...
    R>>   $ V2: chr  "0.03802" "0.9461" "0.6638" "0.9869" ...

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

meanAlong
---------

    meanAlong(1:10, 2)
    R>>  [1] 1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5

packagesUsed
------------

    packagesUsed(c('utils', 'methods'))
    R>>       name version
    R>>  1   utils   3.4.4
    R>>  2 methods   3.4.4

Tout-doux list
--------------

-   \[ \] inSilecico member, a short but useful function you often use?
    Add it in this repo :stuck\_out\_tongue\_winking\_eye:;
