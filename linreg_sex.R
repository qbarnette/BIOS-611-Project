# linear regression: sex

# Create a linear regression model
model_sex <- lm(Days_In_Dataset ~ Sex, data = merged_data)

# Check the model summary
sum_model_sex <- summary(model_sex)

# Tidy the model results
tidy_model_sex <- tidy(model_sex)

# Display the tidy model results in a table
print(tidy_model_sex)