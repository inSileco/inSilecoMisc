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
    R>>   [1] 0.487451840 0.934434469 0.313241743 0.970932093 0.561223618
    R>>   [6] 0.572109757 0.507192442 0.047345697 0.612399040 0.007618606
    R>>  [11] 0.412667398 0.149749661 0.543906280 0.685728308 0.209506034
    R>>  [16] 0.865720866 0.728527392 0.440934710 0.684450641 0.851832188
    R>>  [21] 0.316687836 0.600529293 0.609378662 0.026249713 0.205235254
    R>>  [26] 0.055378769 0.350015166 0.939304302 0.146904825 0.173896555
    R>>  [31] 0.125987738 0.979276311 0.980875490 0.434939067 0.832327171
    R>>  [36] 0.120765817 0.403079897 0.722391989 0.744173736 0.884754916
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    R>>   [1]  5 10  4 10  6  6  6  1  7  1  5  2  6  7  3  9  8  5  7  9  4  7  7
    R>>  [24]  1  3  1  4 10  2  2  2 10 10  5  9  2  5  8  8  9

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
    R>>   num [1:10, 1:2] 0.193 0.732 0.955 0.649 0.544 ...
      str(df2)
    R>>  'data.frame':  10 obs. of  2 variables:
    R>>   $ V1: num  0.193 0.732 0.955 0.649 0.544 ...
    R>>   $ V2: chr  "0.1762" "0.1053" "0.9647" "0.6828" ...

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

To do list
----------

-   \[ \] Each time we think a function could be useful and not related
    to another package, let just put it in this repo
    :stuck\_out\_tongue\_winking\_eye:;

-   \[ \] Add a contributing section :wrench:;

-   \[ \] Let’s prepare the first release;
