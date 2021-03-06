% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getDigits.R
\name{getDigits}
\alias{getDigits}
\title{Extract digits from a character vector}
\usage{
getDigits(x, collapse = NULL)
}
\arguments{
\item{x}{a character vector where digits are sought, or an object which can be coerced by \code{as.character} to a character vector.}

\item{collapse}{an optional character string to separate the results (see [base::paste()).}
}
\value{
A list of digits.
}
\description{
This function extracts all digits found in character vector and returns them
as a list.
}
\examples{
getDigits('txt012-34')
}
