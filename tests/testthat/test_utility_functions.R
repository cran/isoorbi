# Tests: Common utility functions to clean and annotate data ------------------------------------

# make both interactive test runs and auto_testing possible with a dynamic base path to the testthat folder
base_dir <- if (interactive()) file.path("tests", "testthat") else "."

context("utils")



  # orbi_filter_weak_isotopocules
test_that("orbi_filter_weak_isotopocules() tests", {
  #success
  # ...
  #failure
  expect_error(orbi_filter_weak_isotopocules(), "no dataset supplied")
})

  # orbi_filter_satellite_peaks
test_that("orbi_filter_satellite_peaks() tests", {
  #succcess
  df <- orbi_read_isox(system.file("extdata", "testfile_dual_inlet.isox", package = "isoorbi"))
  expect_true(is.tbl(orbi_filter_satellite_peaks(orbi_simplify_isox(df))))
  #failure
  expect_error(orbi_filter_satellite_peaks(), "no dataset supplied")
})

  # orbi_filter_scan_intensity
test_that("orbi_filter_scan_intensity() tests", {
  #success
  #failure
  expect_error(orbi_filter_scan_intensity(), "no dataset supplied")
})
