# Plot the distribution of total steps
daily_activity_combined %>%
  ggplot(aes(x = TotalSteps)) +
  geom_histogram(binwidth = 1000, fill = "blue", color = "white") +
  labs(title = "Distribution of Total Steps", x = "Total Steps", y = "Frequency") +
  theme_minimal()
