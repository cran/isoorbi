## ----include=FALSE------------------------------------------------------------
# default chunk options
knitr::opts_chunk$set(collapse = TRUE, message = FALSE, comment = "#>")

## -----------------------------------------------------------------------------
# load libraries
library(isoorbi) # for Orbitrap functions
library(dplyr) # for data wrangling

## -----------------------------------------------------------------------------
# load and process data
data <- 
  # load file included in isoorbi package
  system.file(package = "isoorbi", "extdata", "testfile_shotnoise.isox") |>
  orbi_read_isox() |>
  # check data for satellite peaks
  orbi_flag_satellite_peaks() |>
  # make sure isotopocules are present in (almost) all scans, otherwise
  # shot noise analyses can be inaccurate
  orbi_flag_weak_isotopocules(min_percent = 90) |> 
  # see if there are any AGC outliers
  orbi_flag_outliers(agc_fold_cutoff = 2)

## -----------------------------------------------------------------------------
data |> orbi_plot_isotopocule_coverage()

## -----------------------------------------------------------------------------
data |> orbi_plot_satellite_peaks()

## -----------------------------------------------------------------------------
data |> orbi_plot_raw_data(
  isotopocules = "M0", 
  y = intensity,
  y_scale = "log"
)

## -----------------------------------------------------------------------------
# calculate ratios vs basepeak
data_w_bp <- 
  data |>
  orbi_define_basepeak("M0")

# calculate shot noise
shot_noise <-
  data_w_bp |>
  orbi_analyze_shot_noise()

# export shot noise to an Excel file
shot_noise |>
  orbi_export_data_to_excel("shot_noise.xlsx") 

## -----------------------------------------------------------------------------
unlink("shot_noise.xlsx")

## -----------------------------------------------------------------------------
# example of the first few rows of the shot-noise calculations
shot_noise |>
  arrange(compound, isotopocule, scan.no) |>
  select(compound, scan.no, time.min, isotopocule,
         ratio, ratio_rel_se.permil, shot_noise.permil) |>
  head(10) |>
  knitr::kable()

## -----------------------------------------------------------------------------
data_w_bp |> orbi_plot_raw_data(y = ratio)

## -----------------------------------------------------------------------------
shot_noise |> orbi_plot_shot_noise()

