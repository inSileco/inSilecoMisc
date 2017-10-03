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

[![Buildstatus](https://ci.appveyor.com/api/projects/status/h2t19erayyod64lj?svg=true)](https://ci.appveyor.com/project/KevCaz/letirmisc-e7i3j/history)
[![Travis](https://travis-ci.org/inSileco/letiRmisc.svg?branch=master)](https://travis-ci.org/inSileco/letiRmisc)
[![codecov](https://codecov.io/gh/inSileco/letiRmisc/branch/master/graph/badge.svg)](https://codecov.io/gh/inSileco/letiRmisc)
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
    #>  [1] 0.722174929 0.933509267 0.777415995 0.891097909 0.661786343
    #>  [6] 0.752970388 0.717931644 0.381510260 0.051516516 0.145375100
    #> [11] 0.366577713 0.956314415 0.127100265 0.371356018 0.115132492
    #> [16] 0.006726503 0.727997581 0.240950289 0.316166311 0.811715991
    #> [21] 0.083110714 0.759327704 0.314531561 0.103099493 0.133065299
    #> [26] 0.473630330 0.841057531 0.681845512 0.486337263 0.602019412
    #> [31] 0.073129748 0.629125095 0.513692842 0.245063686 0.673642728
    #> [36] 0.352112236 0.917308894 0.654130079 0.583123871 0.931152497
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    #>  [1]  8 10  8  9  7  8  8  4  1  2  4 10  2  4  2  1  8  3  4  9  1  8  4
    #> [24]  2  2  5  9  7  5  7  1  7  6  3  7  4 10  7  6 10

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
    #>  num [1:10, 1:2] 0.62 0.232 0.654 0.565 0.551 ...
      str(df2)
    #> 'data.frame':    10 obs. of  2 variables:
    #>  $ V1: num  0.62 0.232 0.654 0.565 0.551 ...
    #>  $ V2: chr  "0.3835" "0.6495" "0.5172" "0.206" ...

### Assign a symbol to a p-value

      sapply(c(.2, .08, .04, .008, 0.0001), signifSymbols)
    #> [1] "n.s." "."    "*"    "**"   "***"

To do list
----------

-   \[ \] Each time we think a function could be useful and not related
    to another package, let just put it in this repo
    :stuck\_out\_tongue\_winking\_eye:

-   \[ \] Add a contributing section :wrench:
