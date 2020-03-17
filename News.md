# inSilecoMisc 0.3.0

* add `tblDown()` to quickly export a list of data frames as a document.
* `findRef()` and `substrBib()` has been removed, see #11.
* `unlist` is no longer an argument of `keepWords()` and `keepLetters()`.
* Review scaleWithin() documentation.
* Add `keepLetters()` and `rmPunct()` :sparkles: see #10.
* Drop @author (to be used for contributors).
* Add @importFrom have been moved to `inSilecoMisc.R`.
* The pkgdown website is now deployed on gh-pages by Travis so `docs/` is now ignored.


# inSilecoMisc 0.2.0

## Changes in documentation :pencil:

* README simplified
* Major cleaning up

## Changes in functions :gear:

- Categorize has been rewritten (see #7).
- `stLength()` has been removed (see #9).
- `logit()` has been removed (see #8).
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

- New function \code{loremIpsum()} to get a piece of a placeholder text.
- New function \code{readYamlHeader()} to read YAML headers.
- New function \code{stApply()} to apply a function to a subset of strings.

## Addition of new parameters

- New parameter `ignore` in `stLength()` to ignore a specific selection of character.



# inSilecoMisc 0.1.1

## Change in the package structure

  - New package name: inSileco (see #3).

## Addition of R functions:

  - New functions \code{findReplace()} and \code{grepReplace()}.
  - New functions \code{logistic()} and \code{logistic2()}.
  - New function \code{addWebIcon()}.
  - New function \code{meanAlong()}, a simple moving window function.

## Changes in existing R functions:

  - New argument \code{exclude} in \code{wordCount()} to select characters to be excluded.


---------

# Early development

## letiRmisc version 0.0.2

### Addition of R functions:

  - New function \code{addURL()}
  - New function \code{findRef()}
  - New function \code{keepWords()}
  - New function \code{logit()}
  - New function \code{multiMatch()}
  - New function \code{signifSymbol()}
  - New function \code{stLength()}
  - New function \code{substrBib()}
  - New function \code{wordCount()} that adresses #1 (@KevCaz)

### Changes in the package structure:

  - bugReportURL has been changed to https://github.com/inSileco/letiRmisc/issues


## First version of letiRmisc version 0.0.1

### Initial functions:

- New function \code{adjustSting()}
- New function \code{aggregateCol()}
- New function \code{setColClass()}
- New function \code{assignIds()}
- New function \code{categorize()}
- New function \code{duplicateRow()}
- New function \code{findThem()}
- New function \code{gaussianShape()}
- New function \code{keepWords()}
- New function \code{squaretize()}
