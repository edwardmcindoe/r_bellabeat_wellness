# Plot time series of total steps
daily_activity_combined %>%
  ggplot(aes(x = ActivityDate, y = TotalSteps)) +
  geom_line(color = "blue") +
  labs(title = "Time Series of Total Steps", x = "Date", y = "Total Steps") +
  theme_minimal()
