# ============================================================
# Script: 02_UDISE_merge_preparation
# Project: School Infrastructure and Health Outcomes (Odisha)
#
# Purpose:
# 1. Clean district-level UDISE panel
# 2. Aggregate school-level data to district-year level
# 3. Construct school infrastructure indices
# 4. Prepare UDISE district-level data for merge
#
# Output:
# analysis_panel.csv (final dataset for regression analysis)
# ============================================================


# -----------------------------
# Load libraries
# -----------------------------
library(dplyr)
library(stringr)
library(tidyverse)



# ============================================================
# 1. Standardize state name and restrict to Odisha
# ============================================================

panel_final <- panel %>%
  mutate(
    state_name = if_else(
      state_name %in% c("Odisha", "Orissa"),
      "Odisha",
      state_name
    )
  ) %>%
  filter(state_name == "Odisha")



# ============================================================
# 2. Remove ID and metadata variables
# (not required for district-level analysis)
# ============================================================

drop_vars <- c(
  "state_code", "district_code", "block_code", "udise_block_name",
  "school_category_id", "school_category_name",
  "school_management_id", "school_management_name",
  "school_type_id", "school_type",
  "location", "source_file"
)

panel_final <- panel_final %>%
  select(-all_of(drop_vars))



# ============================================================
# 3. Define infrastructure variables to aggregate
# These represent counts of facilities across schools
# ============================================================

sum_vars <- c(
  "total_number_of_schools",
  "building",
  "complete_medical_checkup",
  "computer_available",
  "functional_drinking_water",
  "drinking_water",
  "functional_electricity",
  "functional_boy_toilet",
  "functional_girl_toilet",
  "functional_toilet_facility",
  "functional_toilet_and_urinal",
  "functional_urinal",
  "functional_urinal_boy",
  "functional_urinal_girl",
  "handwash",
  "separate_room_for_headmaster",
  "incinerator",
  "internet",
  "kitchen_garden",
  "land_available",
  "librarian",
  "library_or_reading_corner_or_book_bank",
  "medical_checkup",
  "newspaper",
  "playground",
  "rain_water_harvesting",
  "ramps",
  "solar_panel",
  "furniture",
  "water_purifier",
  "water_tested",
  "boundary_wall",
  "boy_toilet",
  "electricity",
  "girl_toilet",
  "single_class_room",
  "toilet_facility",
  "wash_facility_drinking_water_toilet_and_handwash"
)



# ============================================================
# 4. Aggregate school-level data to district-year panel
# Each variable summed across schools within a district-year
# ============================================================

district_panel <- panel_final %>%
  group_by(district_name, academic_year) %>%
  summarise(
    across(all_of(sum_vars), ~ sum(.x, na.rm = TRUE)),
    .groups = "drop"
  )



# ============================================================
# 5. Restrict dataset to 2019-20 cross-section
# (chosen due to better data completeness)
# ============================================================

udise_2019 <- district_panel %>%
  filter(academic_year == "2019-20") %>%
  mutate(academic_year = as.character(academic_year))


# ============================================================
# 6. Prepare dataset for merging
# ============================================================

udise_2019 <- udise_2019 %>%
  mutate(
    state_ut = "Odisha",
    district = str_to_upper(str_trim(district_name))
  )
