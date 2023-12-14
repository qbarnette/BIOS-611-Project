#linear regression: race/ethnicity
library(lmtest)
library(dplyr)
library(broom)
library(tidyverse)
library(stringr)
library(lubridate)

merged_data <- read.csv("source_data/merged_data.csv")

#recode Race so that any response with multiple responses is "Multiple"
unique(merged_data$Race...Ethnicity)

merged_data$Race...Ethnicity[str_detect(merged_data$Race...Ethnicity, ",")] = "Multiple"

# Convert the "DLC" column to a Date object
merged_data$DLC <- mdy(merged_data$DLC)  # Assumes month-day-year format, adjust if needed

# Calculate the difference between today and the "DLC" dates
merged_data$Days_In_Dataset <- as.numeric(difftime(Sys.Date(), merged_data$DLC, units = "days"))

# Convert 'Race...Ethnicity' to a factor
merged_data$Race...Ethnicity <- as.factor(merged_data$Race...Ethnicity)

# Set "White / Caucasian" as the reference category
merged_data$Race...Ethnicity <- relevel(merged_data$Race...Ethnicity, ref = "White / Caucasian")

model_race <- lm(Days_In_Dataset ~ Race...Ethnicity, data = merged_data)

#model summary
sum_model_race <- summary(model_race)

tidy_model_race <- tidy(model_race)

# Display the tidy model results in a table
print(tidy_model_race)