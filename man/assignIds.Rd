% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assignIds.R
\name{assignIds}
\alias{assignIds}
\title{Assign an id to a list of characters or factors}
\usage{
assignIds(x, alphabetical = FALSE)
}
\arguments{
\item{x}{an R object to be coerced into character type.}

\item{alphabetical}{a logical indicating whether an alphabetical sorting
must be applied.}
}
\value{
A vector of Ids.
}
\description{
This function aims to assign an id to factor or similar character
strings. Regarding factors, \code{\link[=as.integer]{as.integer()}} does such task but the order
obtained may differ.
}
\examples{
assignIds(list(2,'f', 'd', 'f'))
}
