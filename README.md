School Infrastructure and Anaemia in Odisha


Overview

This project examines whether school infrastructure availability is associated with anaemia prevalence among women at the district level in Odisha, India. Using district-level data from UDISE+ (2019–20) and NFHS-5 (2019–21), the project constructs composite infrastructure indices and estimates OLS regression models to assess the relationship between school facility coverage and the share of women aged 15–49 who are anaemic.

The analysis is cross-sectional — one year of UDISE data merged to one round of NFHS at the district level — and estimates conditional correlations only. Causal interpretation is not supported by this design. The primary value of the analysis is descriptive: characterising the joint distribution of infrastructure and health outcomes across Odisha's 28 districts, and identifying the data constraints that would need to be addressed in a stronger research design.

Research Question

Is higher school infrastructure coverage — as measured by composite indices of facility availability — associated with lower anaemia prevalence among women aged 15–49 across districts in Odisha?

Data Sources

UDISE+ 2019–20 — School-level administrative data on facility availability, aggregated to the district level. Includes: functional girl toilets, drinking water access, electricity, handwashing facilities, and boundary walls.

NFHS-5 (2019–21) — District-level health and household survey data. Primary outcome: percentage of women aged 15–49 who are anaemic (district mean: ~22%). Control variables: household sanitation coverage, drinking water access.

Raw data are not included due to size. Download from:

UDISE+: https://udiseplus.gov.in

NFHS-5: https://dhsprogram.com

Methodology

Step 1 — Infrastructure Index Construction
School-level UDISE data are aggregated to the district level. For each infrastructure variable, the share of schools within the district that meet the facility threshold is computed. Two composite indices are constructed as the unweighted mean of these shares:

Full Infrastructure Index: girl toilets, drinking water, electricity, boundary walls, handwashing
WASH Infrastructure Index: girl toilets, drinking water, handwashing only

Step 2 — Data Merging
District names are standardised across UDISE and NFHS using manual cleaning. Datasets are merged at the district level, yielding a cross-sectional sample of 28 Odisha districts.
Note: An initial attempt to construct a multi-year UDISE panel was made but abandoned due to inconsistent district codes across years. The final analysis uses 2019–20 as a single cross-section.

Step 3 — Regression Models
Two OLS models are estimated:
Model 1: Anaemia ~ Full Infrastructure Index + Sanitation + Drinking Water
Model 2: Anaemia ~ WASH Infrastructure Index + Sanitation + Drinking Water

Key Results

Neither model produces statistically significant estimates (all p > 0.05). Both models return negative adjusted R², indicating they fit the data worse than a simple mean prediction.

The infrastructure indices show small positive coefficients — counterintuitive in direction but not meaningfully interpretable given the range restriction problem described below.

These results do not imply that infrastructure is irrelevant to health outcomes. They reflect specific features of this dataset that limit statistical inference, detailed in the limitations section.

Exploratory Analysis

WASH Infrastructure Index distribution: Districts cluster between 0.88 and 0.97, with most concentrated above 0.93. This near-ceiling distribution means there is very little variation across districts in WASH coverage — the predictor has almost no room to move, which mechanically limits the OLS estimator's ability to detect any underlying relationship.

Full Infrastructure Index distribution: Wider spread (0.74–0.88), with two clusters around 0.80–0.82 and 0.84–0.86. This provides more usable variation, but the range is still narrow in absolute terms.

Scatter plots: Both infrastructure indices show flat or near-flat regression lines against anaemia prevalence, consistent with the null regression results. The wide scatter of residuals reflects genuine heterogeneity across districts that the infrastructure indices do not capture.

Limitations

Range restriction (ceiling effect): The WASH index ranges only from 0.88 to 0.97 across 28 districts. When a predictor has this little variation, OLS cannot reliably estimate its relationship with the outcome — the estimator becomes highly sensitive to individual outlier districts (leverage sensitivity). The near-zero and positive coefficients are better interpreted as estimation instability than as evidence of a true positive relationship.

Small sample (n = 28): With 28 observations and multiple correlated predictors, the models are underpowered. Sanitation and drinking water access from NFHS are correlated with the UDISE infrastructure indices, creating multicollinearity that inflates standard errors and produces negative adjusted R².

No causal identification: This is a cross-sectional OLS analysis. Districts with better school infrastructure likely differ from lower-infrastructure districts in many other ways — wealth, governance quality, urbanisation, healthcare access — that also affect anaemia prevalence. Without an instrument, natural experiment, or panel design with fixed effects, OLS estimates conflate the effect of infrastructure with these confounders. The analysis is descriptive only.
Aggregation: Both predictors and outcomes are measured at the district level. 

School-level variation in infrastructure is averaged out, and district-level anaemia prevalence aggregates across women with very different individual circumstances. Relationships that exist at the individual or school level may not be detectable in aggregate data.

Omitted variables: Key determinants of anaemia — dietary diversity, maternal education, household income, access to iron supplementation programmes, and utilisation of health services — are not fully captured. Infrastructure availability at schools may matter less than whether girls and women actually use those facilities, which this data cannot measure.

Scope: Results apply to Odisha only and should not be generalised. Odisha's relatively high school infrastructure coverage (by Indian standards) makes it a particularly difficult context in which to detect infrastructure effects.
What This Analysis Suggests for Future Research

The null results are informative. In a high-coverage state like Odisha, variation in whether infrastructure exists may matter less than variation in whether it is used and by whom. A stronger research design would:

Use individual or school-level data rather than district aggregates
Measure utilisation, not just availability
Exploit a source of exogenous variation in infrastructure rollout — a phase-in schedule, eligibility threshold, or policy change — to isolate causal effects
Track outcomes over time using panel data

Replication 
Raw datasets are not included in this repository due to size restrictions.

Data sources:

UDISE+ School Data
https://udiseplus.gov.in

National Family Health Survey (NFHS-5)
https://dhsprogram.com

Place the downloaded files in the data_raw folder before running the scripts.

Repository Structure
Code
Replication
Download UDISE+ 2019–20 and NFHS-5 district-level datasets
Place raw files in data_raw/
Run scripts in numbered order (01 through 07)
Output figures saved to output/


Author
Jagriti Premchandani
