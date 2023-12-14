# linear regression: sex

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

# Create a linear regression model
model_sex <- lm(Days_In_Dataset ~ Sex, data = merged_data)

# Check the model summary
sum_model_sex <- summary(model_sex)

# Tidy the model results
tidy_model_sex <- tidy(model_sex)

# Display the tidy model results in a table
print(tidy_model_sex)