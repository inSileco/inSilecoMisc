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
    #>  [1] 0.87472937 0.57852976 0.47667908 0.12405483 0.03416698 0.56640031
    #>  [7] 0.34361466 0.62077466 0.69974761 0.67364803 0.78124968 0.13031216
    #> [13] 0.25154860 0.98615242 0.71165720 0.36054404 0.47055793 0.70744154
    #> [19] 0.60339272 0.48710804 0.38176605 0.23715803 0.77096065 0.05753196
    #> [25] 0.32675405 0.70646431 0.73816204 0.33520900 0.21131319 0.29498658
    #> [31] 0.26762683 0.10883928 0.02552479 0.75803191 0.19360232 0.48383740
    #> [37] 0.91024492 0.99817079 0.75249744 0.18420117
      categorize(seqv, categ=seq(0.1,0.9, 0.1))
    #>  [1]  9  6  5  2  1  6  4  7  7  7  8  2  3 10  8  4  5  8  7  5  4  3  8
    #> [24]  1  4  8  8  4  3  3  3  2  1  8  2  5 10 10  8  2

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
    #>  num [1:10, 1:2] 0.5321 0.0074 0.909 0.3067 0.6745 ...
      str(df2)
    #> 'data.frame':    10 obs. of  2 variables:
    #>  $ V1: num  0.5321 0.0074 0.909 0.3067 0.6745 ...
    #>  $ V2: chr  "0.7594" "0.01268" "0.2339" "0.356" ...

### Assign a symbol to a p-value

      sapply(c(.2, .08, .04, .008, 0.0001), signifSymbols)
    #> [1] "n.s." "."    "*"    "**"   "***"

### 

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

-   [](#section) Each time we think a function could be useful and not
    related to another package, let just put it in this repo
    :stuck\_out\_tongue\_winking\_eye:

-   [](#section) Add tests for `substrBib.R`

-   [](#section) Add functions we used with our blog (the one I used to
    write URL)

-   [](#section) Once done the two above done, let's prepare the first
    release

-   [](#section) Add a contributing section :wrench:
