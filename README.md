letiRmisc
---------

### Short description

The *letiRmisc* package is a set of useful R functions created to ease
some operations we often do and therefore considered worth having
dedicated functions. All functions are quite easy to code and some may
already be available in other packages. For now, we do not intend to
release them on the CRAN. If you however find one of these function and
intend to use it in your own package, please, help yourself!

Function's names are written using Camel case (*e.g.* `keepWords()`).

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
    R>>   [1] 0.62635645 0.35656617 0.49904340 0.05896622 0.32289375 0.36890949
    R>>   [7] 0.99979555 0.02897292 0.72512204 0.51660605 0.95745173 0.38755804
    R>>  [13] 0.73288609 0.67566944 0.99675485 0.56817599 0.66491407 0.03150301
    R>>  [19] 0.95420617 0.08996680 0.31107807 0.68485770 0.80916907 0.80913642
    R>>  [25] 0.89649242 0.48691462 0.33286787 0.29483986 0.84125406 0.43858752
    R>>  [31] 0.16906464 0.11230704 0.09090313 0.66233585 0.75266916 0.61294493
    R>>  [37] 0.19182201 0.76282287 0.49027772 0.89227744
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    R>>   [1]  7  4  5  1  4  4 10  1  8  6 10  4  8  7 10  6  7  1 10  1  4  7  9
    R>>  [24]  9  9  5  4  3  9  5  2  2  1  7  8  7  2  8  5  9

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

### Assign classes to data frames' columns

      df1 <- matrix(signif(runif(20),4), ncol=2)
      df2 <- assignClass2df(df1, 2, 'character')
      str(df1)
    R>>   num [1:10, 1:2] 0.9766 0.7426 0.0626 0.6225 0.9282 ...
      str(df2)
    R>>  'data.frame':  10 obs. of  2 variables:
    R>>   $ V1: num  0.9766 0.7426 0.0626 0.6225 0.9282 ...
    R>>   $ V2: chr  "0.2553" "0.9337" "0.2374" "0.5203" ...

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

### Add URL

    addURL("https://github.com/inSileco/letiRmisc", "Github repo")
    R>>  [1] "<a href='https://github.com/inSileco/letiRmisc'>Github repo</a>"
    addURL("https://github.com/inSileco/letiRmisc", "Github repo", markdown=TRUE)
    R>>  [1] "[Github repo](https://github.com/inSileco/letiRmisc)"

To do list
----------

-   \[ \] Each time we think a function could be useful and not related
    to another package, let just put it in this repo
    :stuck\_out\_tongue\_winking\_eye:;

-   \[ \] Add a contributing section :wrench:;

-   \[ \] Let's prepare the first release;
