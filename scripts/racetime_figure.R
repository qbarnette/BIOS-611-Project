#generate racetime figure

# Convert the "DLC" column to a Date object
merged_data$DLC <- mdy(merged_data$DLC)  # Assumes month-day-year format, adjust if needed

# Calculate the difference between today and the "DLC" dates
merged_data$Days_In_Dataset <- as.numeric(difftime(Sys.Date(), merged_data$DLC, units = "days"))

# Create a summary data frame with the average length of time by "Race...Ethnicity"
summary_dataR <- aggregate(Days_In_Dataset ~ Race...Ethnicity, data = merged_data, FUN = mean)

# Create a bar plot
ggplot(summary_dataR, aes(x = Race...Ethnicity, y = Days_In_Dataset)) +
  geom_bar(stat = "identity") +
  labs(x = "Race...Ethnicity", y = "Average Length of Time") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.background = element_rect(fill = "white"))

# Save the plot as a PNG file in the 'output' folder 
ggsave("output/racetime_figure.png", width = 6, height = 4)
