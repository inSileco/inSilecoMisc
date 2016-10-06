letiRmisc
=========

The *letiRmisc* package is set of useful R functions. Function's names
are written using Camel case (*e.g.* `keepWords()`). Current state:

[![Build
status](https://ci.appveyor.com/api/projects/status/x5ngkcflyfiixr37?svg=true)](https://ci.appveyor.com/project/KevCaz/letirmisc)
[![Travis](https://travis-ci.org/letiR/letiRmisc.svg?branch=master)](https://travis-ci.org/letiR/letiRmisc)
[![codecov](https://codecov.io/gh/letiR/letiRmisc/branch/master/graph/badge.svg)](https://codecov.io/gh/letiR/letiRmisc)

Installation
============

To get the current development version from Github, use the
[*devtools*](http://cran.r-project.org/web/packages/devtools/index.html)
package.

    if (!require("devtools")) install.packages("devtools")
    devtools::install_github("letiR/letiRmisc")

Main features
=============

Keep a selection of words
-------------------------

      strex <- 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
      keepWords(strex, c(1,4))
    #> [[1]]
    #> [1] "Lorem" "sit"

Assign a category
-----------------

      seqv <- stats::runif(40) %T>% print
    #>  [1] 0.97995661 0.78853051 0.41777281 0.11813707 0.54354485 0.67810542
    #>  [7] 0.72655330 0.68577546 0.25121192 0.23074969 0.11360340 0.59829802
    #> [13] 0.42930668 0.54442002 0.31096329 0.64838518 0.14487256 0.64315932
    #> [19] 0.94408203 0.50568512 0.34531129 0.74281201 0.81507057 0.59164145
    #> [25] 0.61592977 0.09156347 0.81140961 0.50167313 0.22147239 0.04559699
    #> [31] 0.36419250 0.57904685 0.42738639 0.18850491 0.96154887 0.14843470
    #> [37] 0.31030166 0.60505129 0.64971201 0.03240056
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    #>  [1] 10  8  5  2  6  7  8  7  3  3  2  6  5  6  4  7  2  7 10  6  4  8  9
    #> [24]  6  7  1  9  6  3  1  4  6  5  2 10  2  4  7  7  1

Turn a matrix or a dataframe into a squared matrix
--------------------------------------------------

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

Adjust the size of a character string.
--------------------------------------

      paste0('myfilename', adjustString(c(1:2,10,100), 3))
    #> [1] "myfilename001" "myfilename002" "myfilename010" "myfilename100"

Assign classes to the columns of a dataframe
--------------------------------------------

      df1 <- matrix(signif(runif(20),4), ncol=2)
      df2 <- assignClass2df(df1, 2, 'character')
      str(df1)
    #>  num [1:10, 1:2] 0.843 0.584 0.311 0.156 0.271 ...
      str(df2)
    #> 'data.frame':    10 obs. of  2 variables:
    #>  $ V1: num  0.843 0.584 0.311 0.156 0.271 ...
    #>  $ V2: chr  "0.4348" "0.3302" "0.1909" "0.2099" ...

To do list
==========

1.  No real plan at current stage.
2.  Each time we think a function could be useful, let just put it in
    the repo!
