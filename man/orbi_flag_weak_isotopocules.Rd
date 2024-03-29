% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utility_functions.R
\name{orbi_flag_weak_isotopocules}
\alias{orbi_flag_weak_isotopocules}
\title{Flag weak isotopocules}
\usage{
orbi_flag_weak_isotopocules(dataset, min_percent)
}
\arguments{
\item{dataset}{A simplified IsoX data frame to be processed}

\item{min_percent}{A number between 0 and 90. Isotopocule must be observed in at least this percentage of scans (please note: the percentage is defined relative to the most commonly observed isotopocule of each compound)}
}
\value{
A data frame with new column \code{is_weak_isotopocule} that flags weak isotopocules.
}
\description{
The function \code{orbi_filter_weak_isotopocules()} flags isotopocules that are not detected in a minimum of \code{min_percent} of scans. This function evaluates weak isotopocules within each "filename", "block", "segment" and "injection" (if these columns exist), in addition to any groupings already defined before calling this function using dplyr's \code{group_by()}. It restores the original groupings in the returned data frame.
}
\details{
The input \code{dataset} is expected to have at least these 8 columns: \code{filename}, \code{scan.no}, \code{time.min}, \code{compound}, \code{isotopocule}, \code{ions.incremental}, \code{tic}, \code{it.ms}.
}
\examples{
fpath <- system.file("extdata", "testfile_flow.isox", package = "isoorbi")
df <- orbi_read_isox(file = fpath) |>
      orbi_simplify_isox() |>
      orbi_flag_weak_isotopocules(min_percent = 2)

}
