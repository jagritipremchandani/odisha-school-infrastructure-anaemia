# ============================================================
# Script 3: Clean NFHS District Health Data
# Author: Jagriti
# Description:
# Cleans NFHS-5 district level indicators for Odisha,
# standardizes district names, and prepares variables
# for merging with the UDISE infrastructure dataset.
# ============================================================


# ============================================================
# 1. Load libraries
# ============================================================

library(readr)
library(dplyr)
library(janitor)
library(stringr)



# ============================================================
# 2. Load NFHS raw dataset
# ============================================================

nfhs_all <- read_csv(
  "C:/Users/pc/Desktop/PR1/data_raw/nfhs/datafile.csv"
)



# ============================================================
# 3. Standardize column names
# ============================================================

clean_nfhs <- nfhs_all %>%
  clean_names()



# ============================================================
# 4. Filter Odisha observations
# ============================================================

filtered_nfhs <- clean_nfhs %>%
  filter(
    trimws(tolower(state_ut)) == "odisha"
  )



# ============================================================
# 5. Select relevant health indicators
# ============================================================

nfhs_clean <- filtered_nfhs %>%
  select(
    state_ut,
    district_names,
    all_women_age_15_49_years_who_are_anaemic22_percent,
    women_age_15_49_with_10_or_more_years_of_schooling_percent,
    households_with_any_usual_member_covered_under_a_health_insurance_financing_scheme_percent,
    population_living_in_households_with_an_improved_drinking_water_source1_percent,
    population_living_in_households_that_use_an_improved_sanitation_facility2_percent
  )



# ============================================================
# 6. Standardize district names
# (uppercase + remove extra spaces)
# ============================================================

nfhs_clean <- nfhs_clean %>%
  mutate(
    district_names = str_to_upper(str_trim(district_names))
  )



# ============================================================
# 7. Fix district name mismatches
# Required for merging with UDISE data
# ============================================================

district_fix <- c(
  "ANUGUL" = "ANGUL",
  "BARGARH" = "BARAGARH",
  "BALANGIR" = "BOLANGIR",
  "BOUDH" = "BAUDH",
  "DEBAGARH" = "DEOGARH",
  "JAGATSINGHAPUR" = "JAGATSINGHPUR",
  "KENDUJHAR" = "KEONJHAR",
  "KHORDHA" = "KHURDHA",
  "NABARANGAPUR" = "NABARANGPUR",
  "SUBARNAPUR" = "SONEPUR",
  "SUNDARGARH" = "SUNDERGARH",
  "BALESHWAR" = "BALASORE"
)

nfhs_20 <- nfhs_clean %>%
  mutate(
    district = recode(district_names, !!!district_fix)
  )



# ============================================================
# 8. Add year variable
# NFHS-5 corresponds roughly to 2020
# ============================================================

nfhs_20 <- nfhs_20 %>%
  mutate(
    year = "2020"
  )

