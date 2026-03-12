# ============================================================
# PROJECT: UDISE District Education Panel Builder
# AUTHOR: Jagriti
# PURPOSE:
#   Construct a longitudinal district-level panel dataset
#   from multiple UDISE+ CSV files with inconsistent schemas.
#
# DESCRIPTION:
#   - Automatically reads all CSV files in a directory
#   - Harmonizes column names across years
#   - Aligns schema across files
#   - Logs column coverage for transparency
#   - Outputs a clean panel dataset ready for analysis
#
# USE CASE:
#   Education policy analysis, district-level trends,
#   infrastructure and enrolment monitoring.
# ============================================================


# -------------------------------
# 1. Load Required Libraries
# -------------------------------

library(readr)
library(dplyr)
library(purrr)
library(janitor)
library(tibble)


# -------------------------------
# 2. Panel Construction Function
# -------------------------------

make_panel <- function(folder,
                       keep_extras = TRUE,
                       enforce_types = FALSE) {
  
  # -----------------------------------
  # Step 1: Identify input CSV files
  # -----------------------------------
  
  files <- list.files(
    folder,
    pattern = "\\.csv$",
    full.names = TRUE
  )
  
  
  # -----------------------------------
  # Step 2: Extract column names
  # (header-only read for efficiency)
  # -----------------------------------
  
  cols_list <- map(files, function(f) {
    
    raw_cols <- tryCatch(
      names(read_csv(f, n_max = 0, show_col_types = FALSE)),
      error = function(e) character(0)
    )
    
    make_clean_names(raw_cols)
    
  })
  
  
  # -----------------------------------
  # Step 3: Build master column schema
  # -----------------------------------
  
  all_cols <- sort(unique(unlist(cols_list)))
  
  
  # -----------------------------------
  # Step 4: Create column coverage log
  # -----------------------------------
  
  cleaning_log <- tibble(
    file = basename(files),
    present_columns = cols_list,
    missing_columns = map(cols_list, ~ setdiff(all_cols, .x))
  )
  
  
  # -----------------------------------
  # Step 5: Function to read each file
  # -----------------------------------
  
  read_one <- function(path) {
    
    df <- tryCatch(
      read_csv(path, show_col_types = FALSE),
      error = function(e) NULL
    )
    
    if (is.null(df) || ncol(df) == 0) return(NULL)
    
    df <- clean_names(df)
    
    # Add missing columns
    missing <- setdiff(all_cols, names(df))
    
    if (length(missing)) {
      df[missing] <- NA
    }
    
    # Optional: remove extra columns
    if (!keep_extras) {
      df <- df %>% select(all_of(all_cols))
    }
    
    # Optional: enforce column types
    if (enforce_types) {
      df <- type_convert(df, guess_integer = TRUE)
    }
    
    # Add source identifier
    df$source_file <- basename(path)
    
    df
  }
  
  
  # -----------------------------------
  # Step 6: Stack all files
  # -----------------------------------
  
  panel_data <- map(files, read_one) %>%
    compact() %>%
    bind_rows()
  
  
  # -----------------------------------
  # Return outputs
  # -----------------------------------
  
  list(
    panel_data = panel_data,
    cleaning_log = cleaning_log
  )
}


# -------------------------------
# 3. Run the Pipeline
# -------------------------------

result <- make_panel("data_raw")


# -------------------------------
# 4. Extract Outputs
# -------------------------------

panel <- result$panel_data
log   <- result$cleaning_log


# -------------------------------
# 5. Inspect Dataset
# -------------------------------

glimpse(panel)


# -------------------------------
# 6. Export Clean Dataset
# -------------------------------

write_csv(
  panel,
  "data_clean/udise_district_panel.csv"
)


# -------------------------------
# 7. Export Cleaning Log
# -------------------------------

write_csv(
  log,
  "data_clean/column_coverage_log.csv"
)