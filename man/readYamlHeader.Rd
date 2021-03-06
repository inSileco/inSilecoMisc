% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/readYamlHeader.R
\name{readYamlHeader}
\alias{readYamlHeader}
\title{Reads YAML headers}
\usage{
readYamlHeader(con)
}
\arguments{
\item{con}{connection object or a character string.}
}
\value{
A named list, see \code{\link[yaml:yaml.load]{yaml::yaml.load()}} for more details.
}
\description{
Reads YAML headers (typically found in Markdown files).
}
