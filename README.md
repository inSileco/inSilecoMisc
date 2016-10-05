letiRmisc
=========

This is set of useful R functions written using Camel case (*e.g.*
`keepWords()`).

Current state:

[![Build
status](https://ci.appveyor.com/api/projects/status/x5ngkcflyfiixr37?svg=true)](https://ci.appveyor.com/project/KevCaz/letirmisc)
[![Travis](https://travis-ci.org/letiR/letiRmisc.svg?branch=master)](https://travis-ci.org/letiR/letiRmisc)
[![codecov](https://codecov.io/gh/letiR/letiRmisc/branch/master/graph/badge.svg)](https://codecov.io/gh/letiR/letiRmisc)

Installation
============

To get the current development version from Github:

Use the
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
    #>  [1] 0.546366532 0.022102072 0.394032128 0.703742779 0.934058629
    #>  [6] 0.783435688 0.863275660 0.846851804 0.011418206 0.618102907
    #> [11] 0.137535163 0.778011598 0.725995660 0.572717484 0.667546757
    #> [16] 0.767791722 0.832988230 0.553565335 0.356753084 0.123972592
    #> [21] 0.894091795 0.176660166 0.386978409 0.754546763 0.616268203
    #> [26] 0.292016957 0.990391475 0.171699334 0.002962825 0.858721918
    #> [31] 0.250757830 0.662835351 0.214398629 0.842399674 0.059477225
    #> [36] 0.214872714 0.268789530 0.423501552 0.824899581 0.832458798
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    #>  [1]  6  1  4  8 10  8  9  9  1  7  2  8  8  6  7  8  9  6  4  2  9  2  4
    #> [24]  8  7  3 10  2  1  9  3  7  3  9  1  3  3  5  9  9

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

To do list
==========

1.  No real plan at current stage.
2.  Each time we think a function could be useful, let just put it in
    the repo!
