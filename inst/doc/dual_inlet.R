## ----include=FALSE------------------------------------------------------------
# default chunk options
knitr::opts_chunk$set(collapse = TRUE, message = FALSE, comment = "#>")

## ----message=FALSE------------------------------------------------------------
# libraries
library(isoorbi) #load isoorbi R package
library(forcats) #better ordering of factor variables in plots
library(dplyr) # for mutating data frames
library(ggplot2) # for data visualization

## -----------------------------------------------------------------------------
# Read .isox test data
df <- 
  system.file("extdata", "testfile_dual_inlet_new.isox", package = "isoorbi") |>
  orbi_read_isox() |> # reads .isox test data
  orbi_simplify_isox() |> # optionally: keeps only most important columns; equivalent to simplify check box in IsoX
  # check for issues
  orbi_flag_satellite_peaks() |> # removes minor signals that were reported by IsoX in the same tolerance window where the peak of interest is
  orbi_flag_weak_isotopocules(min_percent = 10) |> # removes signals of isotopocules that were not detected at least in min_percent scans
  orbi_flag_outliers(agc_fold_cutoff = 2) |> # removes outlying scans that have more than 2 times or less than 1/2 times the average number of ions in the Orbitrap analyzer; another method: agc_window (see function documentation for more details)
  orbi_define_basepeak(basepeak_def = "M0") # sets one isotopocule in the dataset as the base peak (denominator) for ratio calculation

## ----fig.width=8, fig.height=5------------------------------------------------
df |> orbi_plot_raw_data(isotopocule = "15N", y = tic * it.ms, y_scale = "log")

## -----------------------------------------------------------------------------
# define blocks
df_w_blocks <-
  df |>
  # general definition
  orbi_define_blocks_for_dual_inlet(
    ref_block_time.min = 10, # the reference block is 10 min long
    sample_block_time.min = 10, # the sample block is 10 min long
    startup_time.min = 5, # there is 5 min of data before the reference block starts, to stabilize spray conditions
    change_over_time.min = 2, # it takes 2 min to make sure the right solution is measured after switching the valve
    sample_block_name = "sample",
    ref_block_name = "reference"
  ) |> 
  # fine adjustments
  orbi_adjust_block(block = 1, shift_start_time.min = 2) |> # the 1st reference block is shorter by 2 min, cut from the start
  orbi_adjust_block(block = 4, set_start_time.min = 38, set_end_time.min = 44) # the start and end of the 2nd reference block are manually set

# get blocks info
blocks_info <- df_w_blocks |> orbi_get_blocks_info()
blocks_info |> knitr::kable()

## ----fig.width=8, fig.height=5------------------------------------------------
# ions
df_w_blocks |> 
  orbi_plot_raw_data(
    isotopocules = "15N",
    y = ions.incremental
  )

# ratios - you can see that even the AGC outliers still create decent ratios
df_w_blocks |> 
  orbi_plot_raw_data(
    isotopocules = "15N",
    y = ratio
  )

## ----fig.width=8, fig.height=5------------------------------------------------
df_w_blocks |> 
  orbi_plot_raw_data(
    isotopocules = "15N",
    y = ratio,
    color = NULL,
    add_all_blocks = TRUE,
    show_outliers = FALSE
  ) +
  # add other ggplot elements, e.g. more specific axis labels
  labs(x = "time [min]", y = "15N/M0 ratio")

## ----fig.width=8, fig.height=5------------------------------------------------
df_w_blocks |> 
  orbi_plot_raw_data(
    isotopocules = "15N",
    y = ratio,
    add_all_blocks = TRUE,
    show_outliers = FALSE,
    color = factor(block)
  ) +
  labs(x = "time [min]", y = "15N/M0 ratio", color = "block #")

## -----------------------------------------------------------------------------
# calculate summary
df_summary <- 
  df_w_blocks |>
  # segment (optional)
  orbi_segment_blocks(into_segments = 3) |>
  # calculate results, including for the unused parts of the data blocks
  orbi_summarize_results(
    ratio_method = "sum",
    include_unused_data = TRUE
  )

## ----fig.width=8, fig.height=7------------------------------------------------
# plot all isotopocules using a ggplot from scratch
df_summary |>
  filter(data_type == "data") |>
  mutate(block_seg = sprintf("%s.%s", block, segment) |> fct_inorder()) |>
  # data
  ggplot() +
  aes(
    x = block_seg,
    y = ratio, ymin = ratio - ratio_sem, ymax = ratio + ratio_sem,
    color = sample_name
  ) +
  geom_pointrange() +
  facet_grid(isotopocule ~ ., scales = "free_y") +
  # scales
  scale_color_brewer(palette = "Set1") +
  theme_bw() +
  labs(x = "block.segment", y = "ratio")

## ----fig.width=8, fig.height=6------------------------------------------------
# make a plot for 15N
plot2 <- df_w_blocks |>
  filter(isotopocule == "15N") |>
  mutate(panel = "raw ratios") |>
  # raw data plot
  orbi_plot_raw_data(
    y = ratio,
    color = NULL,
    add_all_blocks = TRUE,
    show_outliers = FALSE
  ) +
   # ratio summary data
  geom_pointrange(
    data = function(df) {
      df_summary |> 
        filter(as.character(isotopocule) == df$isotopocule[1]) |> 
        mutate(panel = "summary")
    },
    map = aes(
      x = mean_time.min, y = ratio, 
      ymin = ratio - ratio_sem, ymax = ratio + ratio_sem,
      shape = sample_name
    ), 
    size = 0.5
  ) +
  facet_grid(panel ~ ., switch = "y") +
  theme(strip.placement = "outside") +
  labs(y = NULL, title = "15N/M0")

plot2

## ----fig.width=8, fig.height=6------------------------------------------------
# same but with 18O
plot2 %+% 
  (df_w_blocks |> filter(isotopocule == "18O") |> mutate(panel = "raw ratios")) +
  labs(title = "18O/M0")

