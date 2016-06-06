letiRmisc
=========

[![Build status](https://ci.appveyor.com/api/projects/status/x5ngkcflyfiixr37?svg=true)](https://ci.appveyor.com/project/KevCaz/letirmisc)
[![Travis](https://travis-ci.org/letiR/letiRmisc.svg?branch=master)](https://travis-ci.org/letiR/letiRmisc)
[![codecov](https://codecov.io/gh/letiR/letiRmisc/branch/master/graph/badge.svg)](https://codecov.io/gh/letiR/letiRmisc)

-   set of useful R functions;
-   functions are written using Camel case (e.g. `keepWords()`).

Installation
============

To get the current development version from github:

Use the
[*devtools*](http://cran.r-project.org/web/packages/devtools/index.html)
package.

    if (!require("devtools")) install.packages("devtools")
    devtools::install_github("letiR/letiRmisc")

Main features
=============

    mycat <- categorize(stats::runif(40), categ=seq(0.25,0.5,0.75))

To do list
==========

1.  No plan at current stage.
