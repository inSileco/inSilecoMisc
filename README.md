letiRmisc
=========

Short description
-----------------

The *letiRmisc* package is a set of useful R functions created to ease
some operations we often and therefore considered worth having dedicated
functions. All functions are quite easy to code and some may already be
available in other packages. For now, we do not intend to release them
in a R package that are quite easy to code but if you find one of them
useful and intend to use in your own package, please, help yourself!

Function's names are written using Camel case (*e.g.* `keepWords()`).

Current status
--------------

[![Build
status](https://ci.appveyor.com/api/projects/status/x5ngkcflyfiixr37?svg=true)](https://ci.appveyor.com/project/KevCaz/letirmisc)
[![Travis](https://travis-ci.org/letiR/letiRmisc.svg?branch=master)](https://travis-ci.org/letiR/letiRmisc)
[![codecov](https://codecov.io/gh/letiR/letiRmisc/branch/master/graph/badge.svg)](https://codecov.io/gh/letiR/letiRmisc)
![](https://img.shields.io/badge/licence-GPLv3-8f10cb.svg)

Installation
============

To get the current development version from Github, use the
[*devtools*](http://cran.r-project.org/web/packages/devtools/index.html)
package.

    if (!require("devtools")) install.packages("devtools")
    devtools::install_github("letiR/letiRmisc")

Main features
=============

      library(letiRmisc)

Keep a selection of words
-------------------------

      strex <- 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
      keepWords(strex, c(1,4))
    #> [[1]]
    #> [1] "Lorem" "sit"

Assign a category
-----------------

      (seqv <- stats::runif(40))
    #>  [1] 0.92106348 0.95516190 0.92149087 0.67616158 0.37269543 0.51993905
    #>  [7] 0.75829336 0.95550640 0.62751132 0.11901294 0.52492968 0.83864208
    #> [13] 0.85445091 0.11147787 0.84055843 0.55508269 0.03375310 0.46399790
    #> [19] 0.63788949 0.91707918 0.86094325 0.49201681 0.75010947 0.32476200
    #> [25] 0.84627897 0.95757644 0.85586580 0.49869588 0.35757314 0.29906145
    #> [31] 0.73321408 0.05569763 0.31801044 0.10709715 0.54840669 0.74304321
    #> [37] 0.83466896 0.63533699 0.19371069 0.39138847
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    #>  [1] 10 10 10  7  4  6  8 10  7  2  6  9  9  2  9  6  1  5  7 10  9  5  8
    #> [24]  4  9 10  9  5  4  3  8  1  4  2  6  8  9  7  2  4

Turn a matrix or a data frame into a squared matrix
---------------------------------------------------

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

Adjust the size of a character string
-------------------------------------

      paste0('myfilename', adjustString(c(1:2,10,100), 3))
    #> [1] "myfilename001" "myfilename002" "myfilename010" "myfilename100"

Assign classes to data frames' columns
--------------------------------------

      df1 <- matrix(signif(runif(20),4), ncol=2)
      df2 <- assignClass2df(df1, 2, 'character')
      str(df1)
    #>  num [1:10, 1:2] 0.495 0.328 0.363 0.496 0.566 ...
      str(df2)
    #> 'data.frame':    10 obs. of  2 variables:
    #>  $ V1: num  0.495 0.328 0.363 0.496 0.566 ...
    #>  $ V2: chr  "0.4682" "0.4545" "0.8149" "0.3687" ...

To do list
==========

-   \[ \] Each time we think a function could be useful and not related
    to another package, let just put it in this repo
    :stuck\_out\_tongue\_winking\_eye:
