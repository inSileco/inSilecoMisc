letiRmisc
=========

[![Travis](https://travis-ci.org/letiR/letiRmisc.svg?branch=master)](https://travis-ci.org/letiR/letiRmisc)

-   Set of useful R functions.

-   Functions are written using Camel case (e.g. `keepWords()`)

Installation
============

To get the current development version from github:

Use the [*devtools*](http://cran.r-project.org/web/packages/devtools/index.html) package.

``` r
if (!require("devtools")) install.packages("devtools")
devtools::install_github("letiR/letiRmisc")
```

Main features
=============

``` r
mycat <- categorize(stats::runif(40), categ=seq(0.25,0.5,0.75))
```

To do list
==========

1.  No plan at current stage.
