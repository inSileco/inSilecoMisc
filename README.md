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

[![Build
status](https://ci.appveyor.com/api/projects/status/x5ngkcflyfiixr37?svg=true)](https://ci.appveyor.com/project/KevCaz/letirmisc)
[![Travis](https://travis-ci.org/letiR/letiRmisc.svg?branch=master)](https://travis-ci.org/letiR/letiRmisc)
[![codecov](https://codecov.io/gh/letiR/letiRmisc/branch/master/graph/badge.svg)](https://codecov.io/gh/letiR/letiRmisc)
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
    #>  [1] 0.454518497 0.878437661 0.881084824 0.600785915 0.101011039
    #>  [6] 0.183613301 0.347674815 0.422815292 0.282740258 0.721463163
    #> [11] 0.049802457 0.998761140 0.859872960 0.683203879 0.773986386
    #> [16] 0.320609943 0.785030537 0.526193264 0.763775519 0.733422424
    #> [21] 0.005047699 0.106589995 0.585296307 0.806422897 0.429850624
    #> [26] 0.995657919 0.704016290 0.083935544 0.663308737 0.649708642
    #> [31] 0.730041666 0.912519403 0.713701260 0.847406298 0.808668708
    #> [36] 0.290254986 0.839878588 0.837137820 0.833939192 0.372147647
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    #>  [1]  5  9  9  7  2  2  4  5  3  8  1 10  9  7  8  4  8  6  8  8  1  2  6
    #> [24]  9  5 10  8  1  7  7  8 10  8  9  9  3  9  9  9  4

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
    #>  num [1:10, 1:2] 0.194 0.449 0.469 0.838 0.208 ...
      str(df2)
    #> 'data.frame':    10 obs. of  2 variables:
    #>  $ V1: num  0.194 0.449 0.469 0.838 0.208 ...
    #>  $ V2: chr  "0.4383" "0.6873" "0.2981" "0.08169" ...

### Assign a symbol to a p-value

      sapply(c(.2, .08, .04, .008, 0.0001), signifSymbols)
    #> [1] "n.s." "."    "*"    "**"   "***"

To do list
----------

-   \[ \] Each time we think a function could be useful and not related
    to another package, let just put it in this repo
    :stuck\_out\_tongue\_winking\_eye:

-   \[ \] Add a contributing section :wrench:
