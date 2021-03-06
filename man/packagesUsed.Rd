% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/packagesUsed.R
\name{packagesUsed}
\alias{packagesUsed}
\title{Get a data frame of package and their installed version.}
\usage{
packagesUsed(vc_pkg)
}
\arguments{
\item{vc_pkg}{a vector of string characters including package names to be
added.}
}
\value{
A data frame of two columns. First is the name of the package; second the version installed.
}
\description{
Get a data frame of package and their installed version.
}
\examples{
packagesUsed(c('utils', 'methods'))
}
