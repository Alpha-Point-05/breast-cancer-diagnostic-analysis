# Wisconsin Breast Cancer Diagnostic Dataset
# Exploratory Analysis
# Author: Mili Bulsari

# Load packages
library(tidyverse)

# Load data
wdbc <- read_csv("data/WDBC_clean.csv")

# View basic structure
glimpse(wdbc)

# Count diagnosis groups
diagnosis_counts <- wdbc %>%
  count(Diagnosis) %>%
  mutate(
    Diagnosis_Label = case_when(
      Diagnosis == "B" ~ "Benign",
      Diagnosis == "M" ~ "Malignant"
    ),
    Percent = round(n / sum(n) * 100, 1)
  )

print(diagnosis_counts)

# Summary of selected tumor features by diagnosis
feature_summary <- wdbc %>%
  group_by(Diagnosis) %>%
  summarise(
    Mean_Radius = mean(Radius_Mean),
    Mean_Texture = mean(Texture_Mean),
    Mean_Perimeter = mean(Perimeter_Mean),
    Mean_Area = mean(Area_Mean),
    Mean_Smoothness = mean(Smoothness_Mean),
    .groups = "drop"
  )

print(feature_summary)
