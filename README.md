School Infrastructure and Anaemia in Odisha

Project Overview

This project examines the relationship between school infrastructure availability and anaemia prevalence among women across districts in Odisha, India.

Using district-level data from UDISE+ (Unified District Information System for Education) and NFHS-5 (National Family Health Survey), the project constructs infrastructure indices and analyzes whether better school infrastructure correlates with lower anaemia prevalence.

The analysis focuses particularly on WASH infrastructure (water, sanitation, and hygiene facilities) in schools.

---

Research Question

Does improved school infrastructure — particularly WASH facilities — correlate with lower anaemia prevalence among women at the district level?

---

Data Sources

1. UDISE+ School Infrastructure Data (2019–20)
   District-level school facility information including:
   
   - functional toilets
   - drinking water availability
   - electricity
   - handwashing facilities
   - boundary walls

2. NFHS-5 (2019–21)
   District-level health indicators including:
   
   - anaemia prevalence among women (15–49 years)
   - household sanitation access
   - drinking water access
   - education indicators

Raw datasets are not included in this repository due to size restrictions.
Users can download the data from:

- UDISE+: https://udiseplus.gov.in
- NFHS: https://dhsprogram.com

---

Methodology

The analysis proceeds in five main steps:

1. Panel Construction (UDISE)
   School-level UDISE data are aggregated to the district-year level.

2. Infrastructure Index Construction
   Two indices are created:
   
   Full Infrastructure Index
   
   - girl toilets
   - drinking water
   - electricity
   - boundary walls
   - handwashing facilities
   
   WASH Infrastructure Index
   
   - girl toilets
   - drinking water
   - handwashing facilities
   
   Facility counts are converted to shares of schools within each district, and indices are computed as the mean of these shares.

3. NFHS Data Cleaning
   
   - district name standardization
   - selection of health and household infrastructure variables

4. Dataset Merging
   UDISE and NFHS datasets are merged at the district level.

5. Statistical Analysis
   Ordinary Least Squares (OLS) regressions are estimated:
   
   - Anaemia vs Full Infrastructure Index
   - Anaemia vs WASH Infrastructure Index
   
   Household sanitation and drinking water access are included as controls.

---

Repository Structure

school-infrastructure-anaemia-odisha

README.md
LICENSE

data_raw/
    README.txt

scripts/
    01_udise_panel_construction.R
    02_udise_infrastructure_index.R
    03_nfhs_clean.R
    04_merge_analysis.R
    05_descriptive_visualization.R

output/
    infra_index_full_distribution.png
    infra_index_wash_distribution.png
    anaemia_vs_full_infrastructure.png
    anaemia_vs_wash_infrastructure.png

---

Key Outputs

The project produces:

- infrastructure indices at the district level
- regression estimates of infrastructure–anaemia relationships
- descriptive statistics and correlation matrices
- distribution plots of infrastructure indices
- scatterplots of anaemia vs infrastructure

---

Replication Instructions

1. Download raw UDISE and NFHS datasets.
2. Place them inside the "data_raw" folder.
3. Run the scripts in the following order:

01_udise_panel_construction.R
02_udise_infrastructure_index.R
03_nfhs_clean.R
04_merge_analysis.R
05_descriptive_visualization.R

4. Output figures will be saved in the "output/" directory.

---

Limitations

- The analysis is cross-sectional at the district level, limiting causal interpretation.
- Infrastructure measures are aggregated and may mask school-level variation.
- Other determinants of anaemia (nutrition, health services, income) are not fully captured.

---

Author

Jagriti

