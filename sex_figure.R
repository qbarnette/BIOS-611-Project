
summary_dataS <- aggregate(Days_In_Dataset ~Sex, data = merged_data, FUN = mean)

# Create a bar plot
ggplot(summary_dataS, aes(x = Sex, y = Days_In_Dataset)) +
  geom_bar(stat = "identity") +
  labs(x = "", y = "Average Length of Time") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 1)) 