#linear regression: race/ethnicity

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