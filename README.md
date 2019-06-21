# inSilecoMisc

[![Build Status](https://travis-ci.org/inSileco/inSilecoMisc.svg?branch=master)](https://travis-ci.org/inSileco/inSilecoMisc)
[![Build status](https://ci.appveyor.com/api/projects/status/rskiyadk6urmsrox/branch/master?svg=true)](https://ci.appveyor.com/project/KevCaz/insilecomisc/branch/master)
[![codecov](https://codecov.io/gh/inSileco/inSilecoMisc/branch/master/graph/badge.svg)](https://codecov.io/gh/inSileco/inSilecoMisc)

## About

### Description

The *inSilecoMisc* package is a set of miscellaneous and handy R functions
written to be used with base R and may already be available in other packages
(especially in packages of the [tidyverse](https://www.tidyverse.org/)).
Functions' names are written using Camel case (*e.g.* `keepWords()`).

So far, we do not intend to release this package on the CRAN. If you however
find one of our helper functions useful and intend to use it in your own
package, please do!



## Installation

To get the current development version from GitHub, use the
[*devtools*](http://cran.r-project.org/web/packages/remotes) package
like so:

```r
if (!require("remotes")) install.packages("remotess")
remotes::install_github("inSileco/inSilecoMisc")
```



## Tout-doux list

- [ ] [inSileco](https://insileco.github.io/) members, a short but useful function you often use? Add it to this repo :stuck_out_tongue_winking_eye:;
