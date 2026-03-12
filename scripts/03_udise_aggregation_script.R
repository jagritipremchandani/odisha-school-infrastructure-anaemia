library(dplyr)
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

#agrregating sum_vars variables district-academic_year 
district_panel <- panel_final %>%
  group_by(district_name, academic_year) %>%
  summarise(across(all_of(sum_vars), ~ sum(.x, na.rm = TRUE)),
            .groups = "drop"
            
  )

 
write.csv(district_panel,"C:/Users/pc/Desktop/PR1/data_clean/udise_district_panel_merge_ready.csv") 
