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
    #>  [1] 0.87002661 0.68940565 0.72941914 0.29213251 0.97809271 0.49424858
    #>  [7] 0.80289257 0.35992241 0.06027119 0.15384650 0.22086057 0.89145176
    #> [13] 0.78452090 0.30964249 0.25414228 0.33281159 0.38493290 0.91119621
    #> [19] 0.17836310 0.50804713 0.92512506 0.16680543 0.58797240 0.23602881
    #> [25] 0.29728528 0.71612235 0.28022698 0.63175900 0.93975834 0.27208718
    #> [31] 0.32280010 0.64577941 0.63414203 0.24157282 0.19047518 0.28700099
    #> [37] 0.32095230 0.52043069 0.53517183 0.55745881
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    #>  [1]  9  7  8  3 10  5  9  4  1  2  3  9  8  4  3  4  4 10  2  6 10  2  6
    #> [24]  3  3  8  3  7 10  3  4  7  7  3  2  3  4  6  6  6

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

<!-- ```{r}
addZeros(12,4)
addZeros(1:12,2)
``` -->
To do list
==========

1.  No real plan at current stage.
2.  Each time we think a function could be useful, let just put it in
    the repo!
