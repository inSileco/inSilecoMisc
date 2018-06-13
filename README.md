letiRmisc
---------

### Short description

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
    R>>   [1] 0.13780573 0.17708009 0.77330267 0.30710906 0.67434486 0.55012283
    R>>   [7] 0.63048250 0.79462166 0.23519578 0.78091285 0.32436219 0.45307328
    R>>  [13] 0.35748185 0.24681598 0.76751976 0.66642766 0.96600211 0.04952655
    R>>  [19] 0.03451996 0.34324260 0.14052181 0.85171006 0.98864700 0.88616456
    R>>  [25] 0.96326465 0.12279069 0.85347725 0.39668267 0.65347731 0.86984038
    R>>  [31] 0.09091806 0.02286843 0.27840141 0.70495423 0.55510063 0.03851234
    R>>  [37] 0.84837195 0.33887783 0.35538841 0.88467788
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    R>>   [1]  2  2  8  4  7  6  7  8  3  8  4  5  4  3  8  7 10  1  1  4  2  9 10
    R>>  [24]  9 10  2  9  4  7  9  1  1  3  8  6  1  9  4  4  9

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
    R>>   num [1:10, 1:2] 0.183 0.128 0.652 0.228 0.919 ...
      str(df2)
    R>>  'data.frame':  10 obs. of  2 variables:
    R>>   $ V1: num  0.183 0.128 0.652 0.228 0.919 ...
    R>>   $ V2: chr  "0.01379" "0.09421" "0.3086" "0.4628" ...

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
