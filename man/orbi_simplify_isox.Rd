% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/loading_functions.R
\name{orbi_simplify_isox}
\alias{orbi_simplify_isox}
\title{Simplify IsoX data}
\usage{
orbi_simplify_isox(dataset)
}
\arguments{
\item{dataset}{IsoX data that is to be simplified}
}
\value{
A tibble containing only the 8 columns: \code{filename}, \code{scan.no}, \code{time.min}, \code{compound}, \code{isotopocule}, \code{ions.incremental}, \code{tic}, \code{it.ms}.
}
\description{
Keep only columns that are directly relevant for isotopocule ratio analysis
}
\examples{
fpath <- system.file("extdata", "testfile_flow.isox", package="isoorbi")
df <- orbi_read_isox(file = fpath) \%>\% orbi_simplify_isox()

}
