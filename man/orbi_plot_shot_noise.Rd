% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shotnoise_functions.R
\name{orbi_plot_shot_noise}
\alias{orbi_plot_shot_noise}
\title{Make a shot noise plot}
\usage{
orbi_plot_shot_noise(
  shotnoise,
  x = c("time.min", "n_effective_ions"),
  permil_target = NA_real_,
  color = "ratio_label",
  colors = c("#1B9E77", "#D95F02", "#7570B3", "#E7298A", "#66A61E", "#E6AB02", "#A6761D",
    "#666666")
)
}
\arguments{
\item{shotnoise}{a \code{shotnoise} data frame}

\item{x}{x-axis for the shot noise plot, either "time.min" or "n_effective_ions"}

\item{permil_target}{highlight the target permil in the shotnoise plot}

\item{color}{which column to use for the color aesthetic (must be a factor)}

\item{colors}{which colors to use, by default a color-blind friendly color palettes (RColorBrewer, dark2)}
}
\value{
a ggplot object
}
\description{
This function creates a shot noise plot using a \code{shotnoise} data frame created by the \code{\link[=orbi_analyze_shot_noise]{orbi_analyze_shot_noise()}} function.
}
\details{
plot shot noise
}
