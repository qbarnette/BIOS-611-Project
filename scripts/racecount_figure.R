#generate race count figure

merged_data <- read.csv("source_data/merged_data.csv")


#recode Race so that any response with multiple responses is "Multiple"
unique(merged_data$Race...Ethnicity)

merged_data$Race...Ethnicity[str_detect(merged_data$Race...Ethnicity, ",")] = "Multiple"

# Check the unique values in the modified variable
unique(merged_data$Race...Ethnicity)

category_counts <- table(merged_data$Race...Ethnicity)

# Create a data frame for plotting
category_data <- data.frame(Category = names(category_counts), Count = as.numeric(category_counts))

# Create a bar plot
ggplot(category_data, aes(x = Category, y = Count)) +
  geom_bar(stat = "identity") +
  labs(x = "Race...Ethnicity", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.background = element_rect(fill = "white"))

# Save the plot as a PNG file in the 'output' folder 
ggsave("output/racecount_figure.png", width = 6, height = 4)


