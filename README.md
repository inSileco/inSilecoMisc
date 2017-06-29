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
    #>  [1] 0.699320133 0.905308002 0.565435791 0.401023228 0.665986358
    #>  [6] 0.169716851 0.206581497 0.264626432 0.777693705 0.492550996
    #> [11] 0.454792771 0.634197751 0.002600739 0.481276193 0.912416062
    #> [16] 0.577680616 0.705649707 0.432527346 0.447152354 0.792409211
    #> [21] 0.141576946 0.759019298 0.338379168 0.789021061 0.636225033
    #> [26] 0.566111082 0.692791396 0.395797402 0.326383253 0.275303109
    #> [31] 0.200194216 0.390363462 0.235563580 0.484680546 0.136392958
    #> [36] 0.573581473 0.953464731 0.199735217 0.105066859 0.467605348
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    #>  [1]  7 10  6  5  7  2  3  3  8  5  5  7  1  5 10  6  8  5  5  8  2  8  4
    #> [24]  8  7  6  7  4  4  3  3  4  3  5  2  6 10  2  2  5

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
    #>  num [1:10, 1:2] 0.182 0.558 0.804 0.495 0.635 ...
      str(df2)
    #> 'data.frame':    10 obs. of  2 variables:
    #>  $ V1: num  0.182 0.558 0.804 0.495 0.635 ...
    #>  $ V2: chr  "0.8895" "0.5227" "0.7376" "0.9095" ...

### Assign a symbol to a p-value

      sapply(c(.2, .08, .04, .008, 0.0001), signifSymbols)
    #> [1] "n.s." "."    "*"    "**"   "***"

To do list
----------

-   \[ \] Each time we think a function could be useful and not related
    to another package, let just put it in this repo
    :stuck\_out\_tongue\_winking\_eye:

-   \[ \] Add a contributing section :wrench:
