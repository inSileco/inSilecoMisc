    ## Loading letiRmisc

letiRmisc
---------

### Short description

The *letiRmisc* package is a set of useful R functions created to ease
some operations we often and therefore considered worth having dedicated
functions. All functions are quite easy to code and some may already be
available in other packages. For now, we do not intend to release them
in a R package that are quite easy to code but if you find one of them
useful and intend to use in your own package, please, help yourself!

Function's names are written using Camel case (*e.g.* `keepWords()`).

### Current status

[![Buildstatus](https://ci.appveyor.com/api/projects/status/h2t19erayyod64lj?svg=true)](https://ci.appveyor.com/project/inSileco/letiRmisc)

[![Travis](https://travis-ci.org/inSileco/letiRmisc.svg?branch=master)](https://travis-ci.org/inSileco/letiRmisc)

[![codecov](https://codecov.io/ghinSileco/letiRmisc/branch/master/graph/badge.svg)](https://codecov.io/gh/inSileco/letiRmisc)

![](https://img.shields.io/badge/licence-GPLv3-8f10cb.svg)

Installation
------------

To get the current development version from Github, use the
[*devtools*](http://cran.r-project.org/web/packages/devtools/index.html)
package.

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
    #>  [1] 0.58547521 0.92230057 0.35841589 0.31642876 0.60768707 0.04429060
    #>  [7] 0.59578700 0.96348705 0.51213524 0.34940805 0.35402894 0.86267078
    #> [13] 0.16509107 0.78388963 0.88912341 0.39946345 0.93843922 0.72087014
    #> [19] 0.10350504 0.59455667 0.01781577 0.30308574 0.76719842 0.54113135
    #> [25] 0.74780129 0.17684553 0.86515509 0.52329887 0.49800126 0.91497168
    #> [31] 0.82488866 0.13851180 0.35075611 0.70865078 0.13127268 0.54955067
    #> [37] 0.29358258 0.30251166 0.80503508 0.01093691
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    #>  [1]  6 10  4  4  7  1  6 10  6  4  4  9  2  8  9  4 10  8  2  6  1  4  8
    #> [24]  6  8  2  9  6  5 10  9  2  4  8  2  6  3  4  9  1

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
    #>  num [1:10, 1:2] 0.676 0.277 0.223 0.711 0.815 ...
      str(df2)
    #> 'data.frame':    10 obs. of  2 variables:
    #>  $ V1: num  0.676 0.277 0.223 0.711 0.815 ...
    #>  $ V2: chr  "0.7635" "0.5353" "0.1308" "0.8818" ...

### Assign a symbol to a p-value

      sapply(c(.2, .08, .04, .008, 0.0001), signifSymbols)
    #> [1] "n.s." "."    "*"    "**"   "***"

To do list
----------

-   \[ \] Each time we think a function could be useful and not related
    to another package, let just put it in this repo
    :stuck\_out\_tongue\_winking\_eye:

-   \[ \] Add a contributing section :wrench:
