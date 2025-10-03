## ----include=FALSE------------------------------------------------------------
# default chunk options
knitr::opts_chunk$set(collapse = FALSE, message = TRUE, comment = "")

## ----message=FALSE------------------------------------------------------------
# libraries
library(isoorbi) #load isoorbi R package
library(dplyr) # for mutating data frames

## -----------------------------------------------------------------------------
# raw files directory
raw_folder <- system.file(package = "isoorbi", "extdata")

# read files
raw_files <-
  raw_folder |> 
  orbi_find_raw(pattern = "nitrate") |> 
  orbi_read_raw(include_spectra = c(1, 10, 100)) |>
  suppressMessages()

# show summary for the read files
raw_files

## -----------------------------------------------------------------------------
# aggregate raw data
agg_data <- raw_files |> orbi_aggregate_raw()
agg_data

## -----------------------------------------------------------------------------
# example: minimal vs. extended aggregator
orbi_get_aggregator("minimal")
orbi_get_aggregator("extended")

# using the extended aggregator instead of the default (standard)
raw_files |> orbi_aggregate_raw(aggregator = "extended")

## -----------------------------------------------------------------------------
raw_files |> orbi_get_problems()
agg_data |> orbi_get_problems()

## -----------------------------------------------------------------------------
# list of isotopocules (can alternatively be in a tsv/csv/xlsx file)
isotopocules <- tibble(
    compound = "nitrate",
    isotopolog = c("M0", "15N", "17O", "18O"),
    mass = c(61.9878, 62.9850, 62.9922, 63.9922),
    tolerance = 1,
    charge = 1
  )

# identify
data <- agg_data |> orbi_identify_isotopocules(isotopocules)

## -----------------------------------------------------------------------------
# this can happen here or later on in the workflow
# in the case of these files there are no satellite peaks
data |> orbi_flag_satellite_peaks() |> orbi_plot_satellite_peaks()

## -----------------------------------------------------------------------------
# this can happen here or later on in the workflow
data |> orbi_get_isotopocule_coverage()
data |> orbi_plot_isotopocule_coverage()

## -----------------------------------------------------------------------------
agg_data |> orbi_get_data(peaks = everything())

