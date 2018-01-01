letiRmisc
---------

### Short description

The *letiRmisc* package is a set of useful R functions created to ease
some operations we often do and therefore considered worth having
dedicated functions. All functions are quite easy to code and some may
already be available in other packages. For now, we do not intend to
release them on the CRAN. If you however find one of these function and
intend to use it in your own package, please, help yourself!

Function’s names are written using Camel case (*e.g.* `keepWords()`).

### Current status

[![Build
status](https://ci.appveyor.com/api/projects/status/h2t19erayyod64lj?svg=true)](https://ci.appveyor.com/project/KevCaz/letirmisc-e7i3j)
[![Travis](https://travis-ci.org/inSileco/letiRmisc.svg?branch=master)](https://travis-ci.org/inSileco/letiRmisc)
[![codecov](https://codecov.io/gh/inSileco/letiRmisc/branch/master/graph/badge.svg)](https://codecov.io/gh/inSileco/letiRmisc)
![](https://img.shields.io/badge/licence-GPLv3-8f10cb.svg)

Installation
------------

To get the current development version from Github, use the
[*devtools*](http://cran.r-project.org/web/packages/devtools/index.html)
package like so:

    if (!require("devtools")) install.packages("devtools")
    devtools::install_github("inSileco/letiRmisc")

Main features
-------------

      library(letiRmisc)

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
    R>>   [1] 0.35821942 0.37346085 0.04835187 0.22222142 0.47545200 0.19401244
    R>>   [7] 0.83363150 0.72291267 0.23791366 0.57531592 0.17209099 0.73852516
    R>>  [13] 0.32936158 0.18553292 0.50540377 0.14560019 0.67086846 0.14742793
    R>>  [19] 0.26942288 0.07084181 0.22068686 0.17378573 0.26585979 0.80266352
    R>>  [25] 0.75660511 0.64356304 0.53897372 0.95587815 0.74137736 0.67393547
    R>>  [31] 0.20938590 0.20642420 0.75125351 0.92033437 0.85572423 0.51098324
    R>>  [37] 0.34894181 0.14138616 0.68197667 0.48995227
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    R>>   [1]  4  4  1  3  5  2  9  8  3  6  2  8  4  2  6  2  7  2  3  1  3  2  3
    R>>  [24]  9  8  7  6 10  8  7  3  3  8 10  9  6  4  2  7  5

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
    R>>   num [1:10, 1:2] 0.34 0.442 0.58 0.664 0.639 ...
      str(df2)
    R>>  'data.frame':  10 obs. of  2 variables:
    R>>   $ V1: num  0.34 0.442 0.58 0.664 0.639 ...
    R>>   $ V2: chr  "0.3206" "0.9892" "0.8891" "0.08009" ...

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

To do list
----------

-   \[ \] Each time we think a function could be useful and not related
    to another package, let just put it in this repo
    :stuck\_out\_tongue\_winking\_eye:;

-   \[ \] Add a contributing section :wrench:;

-   \[ \] Let’s prepare the first release;
