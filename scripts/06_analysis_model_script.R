# ============================================================
# Script 4: Merge and District-Level Analysis
# Author: Jagriti
# Description:
# Examines the relationship between school infrastructure
# and women's anaemia across districts in Odisha.
# ============================================================


# ============================================================
# 1. Load libraries
# ============================================================

library(dplyr)
library(ggplot2)



# ============================================================
# 2. Create analysis dataset
# Select relevant variables and rename for readability
# ============================================================

final_data <- panel_merged |>
  select(
    district_name,
    
    anaemia =
      all_women_age_15_49_years_who_are_anaemic22_percent,
    
    infra_index_full,
    infra_index_wash,
    
    sanitation =
      population_living_in_households_that_use_an_improved_sanitation_facility2_percent,
    
    drinking_water =
      population_living_in_households_with_an_improved_drinking_water_source1_percent
  ) |>
  na.omit()



# ============================================================
# 3. Explore correlations
# ============================================================

cor_matrix <- cor(final_data |> select(-district_name))
print(cor_matrix)



# ============================================================
# 4. Regression Model 1
# Full infrastructure index
# ============================================================

model1 <- lm(
  anaemia ~ infra_index_full + sanitation + drinking_water,
  data = final_data
)



# ============================================================
# 5. Regression Model 2
# WASH infrastructure index
# ============================================================

model2 <- lm(
  anaemia ~ infra_index_wash + sanitation + drinking_water,
  data = final_data
)
# ============================================================
# 5. Regression Model 3

# ============================================================
model3 <- lm(
  anaemia ~ infra_index_wash,
  data = final_data
)

summary(model3)

# ============================================================
# 6. View regression results
# ============================================================

summary(model1)
summary(model2)
