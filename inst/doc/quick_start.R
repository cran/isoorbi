## -----------------------------------------------------------------------------
library(isoorbi)

# Load a path to a system test file
file_path <-system.file("extdata", "testfile_flow.isox", package = "isoorbi")

## ---- message=FALSE, results='hide'-------------------------------------------
# Read .isox test data
df <- orbi_read_isox(file = file_path) 

# Keep only most important columns; equivalent to simplify check box in IsoX
df.simple <- orbi_simplify_isox(dataset = df)

# Filter the data
df.filtered <- df.simple %>% 
                  orbi_filter_isox(time_min = 0, 
                                   time_max = 1, 
                                   compounds = "HSO4-",
                                   isotopocules = c("M0", "34S", "18O"))

# Clean the data by removing noise and outliers
df.clean <- df.filtered %>% orbi_filter_satellite_peaks() %>% 
                            orbi_filter_weak_isotopocules(min_percent = 10) %>% 
                            orbi_filter_scan_intensity(outlier_percent = 10)

# Define base peak and calculate the results table
df.results <- df.clean %>% orbi_define_basepeak(basepeak_def = "M0")%>% 
                              orbi_summarize_results(ratio_method = "sum")


## ---- include=FALSE, echo=FALSE, message=FALSE--------------------------------
#Temporary tests for optional grouping
df.simple$segment <- NA
df.simple$block <- NA
df.simple$injection <- NA
df.simple[df.simple$time.min <0.5,]$block <- "one"
df.simple[df.simple$time.min >0.5,]$block <- "two"
df.simple[df.simple$time.min <0.4,]$segment <- "one"
df.simple[df.simple$time.min >0.4,]$segment <- "twoo"
df.simple[df.simple$time.min <0.3,]$injection <- "onesy"
df.simple[df.simple$time.min >0.3,]$injection <- "2sy"
df.simple$block <- as.factor(df.simple$block)
df.simple$injection <- as.factor(df.simple$injection)
df.simple$segment <- as.factor(df.simple$segment)


