# Ensure that 'Missing.Age' is a character column
merged_data$Missing.Age <- as.character(merged_data$Missing.Age)

# Create age bins in groups of 5
merged_data$Age_Group <- cut(as.numeric(gsub(" Years", "", merged_data$Missing.Age)), 
                             breaks = seq(0, max(as.numeric(gsub(" Years", "", merged_data$Missing.Age)), na.rm = TRUE) + 5, by = 5),
                             labels = paste0(seq(0, max(as.numeric(gsub(" Years", "", merged_data$Missing.Age)), na.rm = TRUE), by = 5), "-", seq(4, max(as.numeric(gsub(" Years", "", merged_data$Missing.Age)), na.rm = TRUE) + 4, by = 5)))

# Create a data frame with the count of missing persons by age group
missing_by_age_group <- merged_data %>%
  group_by(Age_Group) %>%
  summarise(Count = n())

# Create a bar chart for missing persons by age group
ggplot(missing_by_age_group, aes(x = reorder(Age_Group, -Count), y = Count, fill = Age_Group)) +
  geom_bar(stat = "identity", width = 0.5) +
  labs(title = "Missing Persons by Age Group", x = "Age Group") +  # Set x-axis label
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.background = element_rect(fill = "white"))+
  guides(fill = "none")  


# Save the plot as a PNG file in the 'output' folder 
ggsave("output/agegroup_figure.png", width = 6, height = 4)
