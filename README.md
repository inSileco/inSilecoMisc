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
    #>  [1] 0.845029819 0.771323514 0.993742512 0.603218702 0.796029328
    #>  [6] 0.844891513 0.484059720 0.739046565 0.216380110 0.628533843
    #> [11] 0.150105789 0.549997740 0.250499928 0.172539355 0.042721030
    #> [16] 0.363263819 0.612472918 0.756813869 0.475340533 0.939050549
    #> [21] 0.960881110 0.265313676 0.013539796 0.416126973 0.341090177
    #> [26] 0.841992221 0.401021046 0.331270216 0.442558951 0.294345590
    #> [31] 0.799838497 0.272599038 0.567162156 0.601581940 0.509293638
    #> [36] 0.005232859 0.702939905 0.359574477 0.599979019 0.518792169
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    #>  [1]  9  8 10  7  8  9  5  8  3  7  2  6  3  2  1  4  7  8  5 10 10  3  1
    #> [24]  5  4  9  5  4  5  3  8  3  6  7  6  1  8  4  6  6

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
    #>  num [1:10, 1:2] 0.556 0.49 0.409 0.681 0.136 ...
      str(df2)
    #> 'data.frame':    10 obs. of  2 variables:
    #>  $ V1: num  0.556 0.49 0.409 0.681 0.136 ...
    #>  $ V2: chr  "0.7808" "0.6727" "0.3276" "0.7181" ...

To do list
==========

1.  No real plan at current stage.
2.  Each time we think a function could be useful, let just put it in
    the repo!
