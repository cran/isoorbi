# isoorbi 1.3.1

This is a patch containing compatibility updates.


# isoorbi 1.3.0

This is a minor release adding new features.

## Breaking changes

There are no breaking changes in this release (all changes and new features are backwards compatible).

## New features

Plotting functions:

* `orbi_plot_satellite_peaks()` implemented
* `orbi_plot_isotopocule_coverage()` implemented
* `orbi_plot_raw_data()` implemented

Information functions:

* `orbi_get_isotopocule_coverage()`

## Enhancements

* `orbi_simplify_isox()` now includes `intensity` by default and allows addition of user-specified columns
* `orbi_flag_satellite_peaks()`, `orbi_flag_weak_isotopocules()` and `orbi_flag_outliers()` now provide additional information when no data is flagged and how to visualize what was flagged (if anything)

## Bug Fixes

* `orbi_add_blocks_to_plot()` now supports log scale axes

# isoorbi 1.2.0

This is a minor release adding new features.

## Breaking changes

There are no breaking changes in this release (all changes and new features are backwards compatible).

## New features

* `orbi_find_isox()` added
* `orbi_analyze_noise()` implemented
* `orbi_plot_shot_noise()` implemented
* `orbi_flag_satellite_peaks()`, `orbi_flag_weak_isotopocules()` and `orbi_flag_outliers()` supersede `orbi_filter_satellite_peaks()`, `orbi_filter_weak_isotopocules()` and `orbi_filter_scan_intensity()`
* `orbi_export_data_to_excel()` implemented
* `orbi_define_block_for_flow_injection()` implemented
* `orbi_add_blocks_to_plot()` implemented

## Enhancements

* all loading and utility functions provide more details in the info message about what has been done, what was affected, and how long it took
* all loading and utility functions catch processing errors and report the information back to the user
* `orbi_read_isox()` now can read multiple .isox files at once and includes the .isox `filepath` in the resulting tibble

## Bug fixes

* data frame groupings introduced in flagging/filtering functions are now removed again at the end of the function

# isoorbi 1.1.0

This is a minor release adding new features and fixing a few bugs.

## Breaking changes

There are no breaking changes in this release (all changes and new features are backwards compatible).

## New features

* implemented functionality for dual inlet data acquisitions, see `orbi_define_blocks_for_dual_inlet()` and `orbi_get_blocks_info()`
* implemented package settings, using internal functions `isoorbi::orbi_get_settings`, `isoorbi::orbi_set_settings`

## Enhancements

* removed dependency on `stringr`
* implemented native pipe `|>` (R version requirement increased to 4.1.0) and removed dependency on `magrittr`
* added `.by` parameter for `orbi_summarize_results()` for option to manually adjust grouping

## Bug fixes

* `dplyr` changes to joins with explicit `multiple` argument. `multiple` now defaults to "all", and the options of "error" and "warning" are now deprecated in favor of using `relationship`. 

# isorbi 1.0.0

First public release.
