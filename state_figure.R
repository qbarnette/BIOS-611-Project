library(ggplot2)

ggplot(merged_data, aes(x = State)) +
  geom_bar(fill = "lightblue") +
  labs(title = "Missing Persons by State") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 80, hjust = 1)) 