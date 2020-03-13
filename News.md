# inSilecoMisc 0.2.0.9000

* add `keepLetters()` and `rmPunct()` :sparkles: see [#10]
* drop @author
* add @importFrom have been moved to `inSilecoMisc.R`
* pkgdown website now deployed on gh-pages by Travis so `docs/` is now ignored.

# inSilecoMisc 0.2.0

## Changes in documentation :pencil:

- README simplified
- Major cleaning up

## Changes in functions :gear:

- categorize has been rewritten (see #7)
- remove `stLength()` (see #9)
- remove `logit()` (see #8)
- In `dfTemplate()` the values of argument `col_classes` are now checked, a test has been added.
- In `dfTemplate()` `fill` is now a vector whose values are replicated so its length equals the number of columns.
- In `dfTemplate()`, `col_classes` values are replicated so its length equals the number of columns.
- In `dfTemplate()`, `fill` now determines the classes of the columns when `col_classes` if `NULL` which is the new default value.



# inSilecoMisc 0.1.3

## Changes in the package structure

- `README.Rmd` has been removed and most of its content is in the vignette
*inSilecoMisc, an overview*


## Changes in functions

- Changes in function names
  - `assignClass2df()` => `setColClass()`
  - `strLength()` => `stLength()`
  - `applyString()` => `stApply()`

- New functions
  - `whichIs()` which looks for the values of a given vector in another one and returns the positions of matchs as a list;
  - `dfTemplate()` and `dfTemplateMatch()` to create data frames from scratch or based on one or two data frames.



# inSilecoMisc 0.1.2

## Changes in the package structure

- add website built with [pkgdown](https://github.com/r-lib/pkgdown).

## Addition of R functions

- New R function \code{loremIpsum()} to get a piece of a placeholder text.
- New R function \code{readYamlHeader()} to read YAML headers.
- New R function \code{stApply()} to apply a function to a subset of strings.

## Addition of new parameters

- New parameter `ignore` in `stLength()` to ignore a specific selection of character.



# inSilecoMisc 0.1.1

## Change in the package structure

  - New package name: inSileco (see #3).

## Addition of R functions:

  - New R functions \code{findReplace()} and \code{grepReplace()}.
  - New R functions \code{logistic()} and \code{logistic2()}.
  - New R function \code{addWebIcon()}.
  - New R function \code{meanAlong()}, a simple moving window function.

## Changes in existing R functions:

  - New argument \code{exclude} in \code{wordCount()} to select characters to be excluded.


---------

# Early development

## letiRmisc version 0.0.2

### Addition of R functions:

  - New R function \code{addURL()}
  - New R function \code{findRef()}
  - New R function \code{keepWords()}
  - New R function \code{logit()}
  - New R function \code{multiMatch()}
  - New R function \code{signifSymbol()}
  - New R function \code{stLength()}
  - New R function \code{substrBib()}
  - New R function \code{wordCount()} that adresses #1 (@KevCaz)

### Changes in the package structure:

  - bugReportURL has been changed to https://github.com/inSileco/letiRmisc/issues


## First version of letiRmisc version 0.0.1

### Initial functions:

- New R function \code{adjustSting()}
- New R function \code{aggregateCol()}
- New R function \code{setColClass()}
- New R function \code{assignIds()}
- New R function \code{categorize()}
- New R function \code{duplicateRow()}
- New R function \code{findThem()}
- New R function \code{gaussianShape()}
- New R function \code{keepWords()}
- New R function \code{squaretize()}
