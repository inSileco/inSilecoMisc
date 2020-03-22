# inSilecoMisc
[![Build Status](https://travis-ci.org/inSileco/inSilecoMisc.svg?branch=master)](https://travis-ci.org/inSileco/inSilecoMisc)
[![Build status](https://ci.appveyor.com/api/projects/status/rskiyadk6urmsrox/branch/master?svg=true)](https://ci.appveyor.com/project/KevCaz/insilecomisc/branch/master)
[![codecov](https://codecov.io/gh/inSileco/inSilecoMisc/branch/master/graph/badge.svg)](https://codecov.io/gh/inSileco/inSilecoMisc)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)


## About

### Description

The *inSilecoMisc* package is a set of miscellaneous and handy R functions
written to be used with base R, see the [tour vignette](http://insileco.github.io/inSilecoMisc/articles/overview.html) for more information

Note that some of the function and may already be available in other packages
(especially in packages of the [tidyverse](https://www.tidyverse.org/)).
Functions' names are written using Camel case (*e.g.* `keepWords()`).

So far, we do not intend to release this package on the CRAN. If you however
find one of our helper functions useful and intend to use it in your own
package, please do!


## Installation

The current development is on GitHub and can be install with the
[remotes](http://cran.r-project.org/web/packages/remotes) :package::

```r
if (!require("remotes")) install.packages("remotes")
remotes::install_github("inSileco/inSilecoMisc")
```
