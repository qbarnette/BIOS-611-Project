#generate state figure

ggplot(merged_data, aes(x = State)) +
  geom_bar(fill = "lightblue") +
  labs(title = "Missing Persons by State") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 80, hjust = 1),
        panel.background = element_rect(fill = "white"))

# Save the plot as a PNG file in the 'output' folder 
ggsave("output/state_figure.png", width = 6, height = 4)

