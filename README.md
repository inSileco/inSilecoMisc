    ## Loading letiRmisc

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
    devtools::install_github("letiR/letiRmisc")

Main features
-------------

      library(letiRmisc)

### Keep a selection of words

      strex <- 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
      keepWords(strex, c(1,4))
    #> [[1]]
    #> [1] "Lorem" "sit"

### Assign a category

      (seqv <- stats::runif(40))
    #>  [1] 0.17596186 0.48121323 0.33436464 0.34127871 0.30965684 0.39698747
    #>  [7] 0.79100223 0.18298853 0.06088039 0.11330060 0.88441000 0.06876370
    #> [13] 0.21327838 0.74806743 0.16381508 0.67169667 0.88973993 0.66308142
    #> [19] 0.72965854 0.10189911 0.72359123 0.68101051 0.45348379 0.72012461
    #> [25] 0.82507790 0.65853531 0.43536189 0.24086384 0.21191026 0.54834831
    #> [31] 0.12513388 0.93897101 0.71681941 0.85847571 0.82176781 0.76090001
    #> [37] 0.40699340 0.90604624 0.75641573 0.20188397
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    #>  [1]  2  5  4  4  4  4  8  2  1  2  9  1  3  8  2  7  9  7  8  2  8  7  5
    #> [24]  8  9  7  5  3  3  6  2 10  8  9  9  8  5 10  8  3

### Turn a matrix or a data frame into a squared matrix

      mat <- matrix(1:15, 3, 5, dimnames=list(LETTERS[3:1], LETTERS[1:5]))
      print(mat)
    #>   A B C  D  E
    #> C 1 4 7 10 13
    #> B 2 5 8 11 14
    #> A 3 6 9 12 15
      squaretize(mat, reorder=FALSE)
    #>   A B C  D  E
    #> C 1 4 7 10 13
    #> B 2 5 8 11 14
    #> A 3 6 9 12 15
    #> D 0 0 0  0  0
    #> E 0 0 0  0  0

### Adjust the size of a character string

      paste0('myfilename', adjustString(c(1:2,10,100), 3))
    #> [1] "myfilename001" "myfilename002" "myfilename010" "myfilename100"

### Assign classes to data frames' columns

      df1 <- matrix(signif(runif(20),4), ncol=2)
      df2 <- assignClass2df(df1, 2, 'character')
      str(df1)
    #>  num [1:10, 1:2] 0.4233 0.869 0.9873 0.1836 0.0492 ...
      str(df2)
    #> 'data.frame':    10 obs. of  2 variables:
    #>  $ V1: num  0.4233 0.869 0.9873 0.1836 0.0492 ...
    #>  $ V2: chr  "0.05067" "0.4639" "0.1098" "0.01376" ...

### Assign a symbol to a p-value

      sapply(c(.2, .08, .04, .008, 0.0001), signifSymbols)
    #> [1] "n.s." "."    "*"    "**"   "***"

### Find reference and extract bibliography

    findRef(text='First \\cite{Pimm2000}, second \\Citep{May1972}')
    #>        key freq
    #> 1  May1972    1
    #> 2 Pimm2000    1

    findRef(text='First @Pimm2000, second @May1972, third [@May1972]', markdown=TRUE)
    #>        key freq
    #> 1  May1972    2
    #> 2 Pimm2000    1

    file.name <- system.file('Bib', 'RJC.bib', package='RefManageR')
    bib <- RefManageR::ReadBib(file.name)
    txt <- 'First \\cite{kim1995estimating}, second \\Citep{fu2006statistical}'
    tfile <- tempfile(fileext = '.bib')
    out <- substrBib(bib, txt)
    (out)
    #> [1] W. J. Fu, J. Hu, T. Spencer, et al. "Statistical models in
    #> assessing fold change of gene expression in real-time RT-PCR
    #> experiments". In: _Computational biology and chemistry_ 30.1
    #> (2006), pp. 21-26.
    #> 
    #> [2] M. Y. Kim, B. S. Pasternack, R. J. Carroll, et al. "Estimating
    #> the reliability of an exposure variable in the presence of
    #> confounders". In: _Statistics in medicine_ 14.13 (1995), pp.
    #> 1437-1446.

To do list
----------

-   \[ \] Each time we think a function could be useful and not related
    to another package, let just put it in this repo
    :stuck\_out\_tongue\_winking\_eye:

-   \[ \] Add tests for `substrBib.R`

-   \[ \] Add functions we used with our blog (the one I used to
    write URL)

-   \[ \] Once done the two above done, let's prepare the first release

-   \[ \] Add a contributing section :wrench:
