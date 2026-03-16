School Infrastructure and Anaemia in Odisha

Project Overview

This project examines the relationship between school infrastructure availability and anaemia prevalence among women across districts in Odisha, India.

Using district-level data from UDISE+ (Unified District Information System for Education) and NFHS-5 (National Family Health Survey), the project constructs infrastructure indices and analyzes whether better school infrastructure correlates with lower anaemia prevalence.

The analysis focuses particularly on studying correlations between infrastructure and anaemia between districts
---

Research Question

Does improved school infrastructure — correlate with lower anaemia prevalence among women at the district level?

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
   
Data
District-level administrative data covering 28 districts with the following variables:
anaemia – prevalence of anaemia among children
infra_index_full – composite infrastructure index
infra_index_wash – WASH-specific infrastructure index
sanitation – sanitation coverage
drinking_water – access to drinking water

Methodology
Two OLS regression models are estimated.
Model 1
Anaemia ~ Infrastructure Index (Full) + Sanitation + Drinking Water
Model 2
Anaemia ~ WASH Infrastructure Index + Sanitation + Drinking Water
The models are estimated using R and summarized using the broom package.


Key Results
Both models show no statistically significant relationship between WASH infrastructure indices and anaemia prevalence.

Key observations:
None of the predictors are statistically significant (p > 0.05).
Adjusted R² is negative, indicating the models perform worse than a simple mean prediction.
Infrastructure indices show positive coefficients, likely reflecting estimation noise rather than a true relationship.
Model 2 provides a slightly better fit but remains inconclusive.

---
Exploratory Analysis of Infrastructure and Anaemia

Four plots were generated to visually explore the relationship between district-level infrastructure indices and anaemia prevalence among children.

1. Distribution of Full Infrastructure Index
-The histogram of the full infrastructure index shows:
-A wider distribution between 0.74 and 0.88.
-Evidence of two clusters, roughly around 0.80–0.82 and 0.84–0.86.
This distribution provides more variability, making it somewhat more suitable for regression analysis compared to the WASH index.


---

2. Distribution of WASH Infrastructure Index
-The histogram of the WASH index shows that:
-Most districts cluster between 0.93 and 0.96.
-The distribution is right-skewed, with very few districts below 0.90.
This pattern indicates a ceiling effect, where infrastructure coverage is already high across most districts, reducing statistical variability.


---
3. Anaemia vs Full Infrastructure Index

The second scatter plot compares anaemia prevalence with the Full Infrastructure Index.

Key observations:

-The full infrastructure index ranges from approximately 0.74 to 0.88, providing a wider spread than the WASH index.
-The regression line is nearly flat, indicating little to no systematic relationship.
-Several districts appear as outliers, with both high anaemia and moderate infrastructure scores.
-Overall, this plot again suggests that infrastructure indices alone do not strongly explain differences in anaemia prevalence across districts.


4. Anaemia vs WASH Infrastructure Index

The first scatter plot examines the relationship between the WASH Infrastructure Index and anaemia prevalence.

Key observations:

-The WASH index ranges from approximately 0.88 to 0.97, indicating that most districts have relatively high WASH infrastructure coverage.
-The regression line shows a slight positive slope, meaning anaemia prevalence marginally increases with higher WASH index values.
-This pattern is counterintuitive, as improved water, sanitation, and hygiene infrastructure would theoretically reduce anaemia risk.
-The data points are widely scattered, indicating a very weak relationship between the variables.

A likely explanation is range restriction: because most districts already have high WASH scores, there is limited variation in the predictor variable, making it difficult to detect meaningful correlations.

---

Interpretation
-The exploratory plots suggest that infrastructure indices alone are weak predictors of anaemia prevalence in the dataset.
-Several factors may explain this result:
-Limited variation in WASH infrastructure, creating a ceiling effect.
-Omitted variables such as dietary diversity, maternal education, poverty levels, and healthcare access.

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
3. Run the scripts in the numeric order 

4. Output figures will be saved in the "output/" directory.

---

Limitations
Several constraints limit inference:
- Small sample size (n = 28) reduces statistical power
- Multicollinearity risk due to overlap between infrastructure indices and control variables
- The analysis is cross-sectional at the district level, limiting causal interpretation.
- Infrastructure measures are aggregated and may mask school-level variation.
- Other determinants of anaemia (nutrition, health services, income) are not fully captured.

---

Author

Jagriti

