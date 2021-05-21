# inSilecoMisc (devel)

* New function `rename()` to rename data frames, list, etc.
* New function `commaAnd()` to collapse elements of a vector and add element separators.
* Add code of conduct.
* Add contributing guidelines.


# inSilecoMisc 0.6.0

* Use GitHub actions instead of Travis CI and Appveyor.
* New functions `getBasename()`, `getDetails()`, `getDigits()`, `getExtension()`, `getFilename()`, `getLocation()`, `getName()` designed to help maniuplate file and directorynames.
* `msg*()` functions all gain an argument `appendLF` to append a new line or not.


# inSilecoMisc 0.5.0

* `dfTemplateMatch()` gains an argument `order` to order column of the output
data frame according to the template (see #20).
* add `stopwatch()` and `timer()`.
* add `seqRg()` that generates a regular sequence based on the range of a vector.
* add `seqRow()` and `seqCol()` that generate a regular sequences based on the number of rows and columns (respectively) of a data frame (or a matrix).


# inSilecoMisc 0.4.0

* New functions `msgInfo()`, `msgError()`, `msgSuccess()` `msgWarning()` to send notices to user while a function is being executed.
* New function `keepInitials()` to keep the initials of character strings.
* `keepWords()`, `keepLetters()` and `wordCount()` have been re-written.
* `LoremIpsum()` now includes 2 paragraphs and any number of words can be requested.
* Remove `magrittr` from the list of dependencies and thus all pipes, see #14.
* in `scaleWithin()`, `nval` is now `n`.
* Remove `addURL()` and `addWebIcon()`, see #16.
* Remove `findReplace()` and `grepReplace()`m see #15.
* `adjustString()` has been entirely re-written and has been renamed
  `adjustStrings()` as it now accepts vectors of character strings. Argument
  `nzchar` no longer accepts negative real or strings and has been renamed `n`.
  Also `before` becomes `align` and can takes "right", "left" or "center". Last,
  it gains the  argument `add` that allows the user to add make `n` a number of
  character to be added.


# inSilecoMisc 0.3.0

* Add `tblDown()` to quickly export a list of data frames as a document.
* `findRef()` and `substrBib()` has been removed, see #11.
* `unlist` is no longer an argument of `keepWords()` and `keepLetters()`.
* Review `scaleWithin()` documentation.
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

- New function `loremIpsum()` to get a piece of a placeholder text.
- New function `readYamlHeader()` to read YAML headers.
- New function `stApply()` to apply a function to a subset of strings.

## Addition of new parameters

- New parameter `ignore` in `strLength()` to ignore a specific selection of character.



# inSilecoMisc 0.1.1

## Change in the package structure

  - New package name: inSileco (see #3).

## Addition of R functions:

  - New functions `findReplace()` and `grepReplace()`.
  - New functions `logistic()` and \code{logistic2()}.
  - New function `addWebIcon()`.
  - New function `meanAlong()`, a simple moving window function.

## Changes in existing R functions:

  - New argument \code{exclude} in `wordCount()` to select characters to be excluded.


---------

# Early development

## letiRmisc version 0.0.2

### Addition of R functions:

  - New function `addURL()`
  - New function `findRef()`
  - New function `keepWords()`
  - New function `logit()`
  - New function `multiMatch()`
  - New function `signifSymbol()`
  - New function `stLength()`
  - New function `substrBib()`
  - New function `wordCount()` that adresses #1 (@KevCaz)

### Changes in the package structure:

  - bugReportURL has been changed to https://github.com/inSileco/letiRmisc/issues


## First version of letiRmisc version 0.0.1

### Initial functions:

- New function `adjustSting()`
- New function `aggregateCol()`
- New function `setColClass()`
- New function `assignIds()`
- New function `categorize()`
- New function `duplicateRow()`
- New function `findThem()`
- New function `gaussianShape()`
- New function `keepWords()`
- New function `squaretize()`
