# Tests: Functions to calculate ratios and stats --------------------------------------------

# make both interactive test runs and auto_testing possible with a dynamic base path to the testthat folder
base_dir <- if (interactive()) file.path("tests", "testthat") else "."

context("utils")


  # calculate_ratios_sem
test_that("calculate_ratios_sem() tests", {
  #success
  expect_equal(calculate_ratios_sem(ratios = c(1,2,3)), 0.57735026919)
  expect_type(calculate_ratios_sem(ratios = c(1,2,3)), "double")

  #failure
  expect_error(calculate_ratios_sem(), "input vector for ratios supplied")
})

  # calculate_ratios_gmean
test_that("calculate_ratios_gmean() tests", {
  #success
  list<- c(4,5,6)
  expect_type(calculate_ratios_gmean(ratios = list), "double")
  expect_equal(calculate_ratios_gmean(ratios = list), 4.9324241486609)

  #failure
  expect_error(calculate_ratios_gmean(), "input vector for ratios supplied")
})

  # calculate_ratios_gsd
test_that("calculate_ratios_gsd() tests", {
  #success
  expect_type(calculate_ratios_gsd(ratios = c(1,2,3)), "double")

  #failure
  expect_error(calculate_ratios_gsd(), "input vector for ratios supplied")
})

  # calculate_ratios_gse
test_that("calculate_ratios_gse() tests", {
  #success
  expect_type(calculate_ratios_gse(ratios = c(4,5,6)), "double")

  #failure
  expect_error(calculate_ratios_gse(), "input vector for ratios supplied")
})

  # calculate_ratios_slope
test_that("calculate_ratios_slope() tests", {
  #success
  x <- c(0,1,2,3)
  y <- c(0,1,2,3)
  expect_type(calculate_ratios_slope(x,y), "double")
  expect_equal(calculate_ratios_slope(x,y), 1)

  #failure
  expect_error(calculate_ratios_slope(), "input vector for x supplied")

})

  # calculate_weighted.vector.sum
test_that("calculate_weighted.vector.sum() tests", {
  #success
  x<- c(2,4,6)
  y<- c(3,5,7)
  expect_type(calculate_ratios_weighted_sum(x,y), "double")
  #failure
  expect_error(calculate_ratios_weighted_sum(), "input vector for x supplied")
})

  # orbi_calculate_ratios
test_that("orbi_calculate_ratios() tests", {
  #success
  a<- 1:10
  b<- 1:10

    #mean
  expect_equal(orbi_calculate_ratios(a,b,"mean"), 1)
    #sum
  expect_equal(orbi_calculate_ratios(a,b,"sum"), 1)
    #slope
  expect_equal(orbi_calculate_ratios(a,b,"slope"),1)
    #geometric_mean
  expect_equal(orbi_calculate_ratios(a,b,"geometric_mean"),1)
    #weighted_sum
  expect_equal(orbi_calculate_ratios(a,b,"weighted_sum"),1)
    #median
  expect_equal(orbi_calculate_ratios(a,b,"median"), 1)

  expect_error(orbi_calculate_ratios(a,b,"median2"), "`ratio_method` has to be `mean`, `sum`, `median`, `geometric_mean`, `slope` or `weighted_sum`")

  #failure
  expect_error(orbi_calculate_ratios(), "no input for numerator supplied")

})

