# Calculate and plot average daily activity metrics
daily_activity %>%
  summarise(
    AvgTotalSteps = mean(TotalSteps, na.rm = TRUE),
    AvgTotalDistance = mean(TotalDistance, na.rm = TRUE),
    AvgCalories = mean(Calories, na.rm = TRUE)
  ) %>%
  gather(key = "Metric", value = "Value") %>%
  ggplot(aes(x = Metric, y = Value, fill = Metric)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Daily Activity Metrics", x = "Metric", y = "Value")

# Calculate and plot average daily activity metrics with proper handling for TotalDistance
avg_metrics <- daily_activity %>%
  summarise(
    AvgTotalSteps = mean(TotalSteps, na.rm = TRUE),
    AvgTotalDistance = mean(TotalDistance, na.rm = TRUE),
    AvgCalories = mean(Calories, na.rm = TRUE)
  )

# Print the average metrics to check values
print(avg_metrics)

# Reshape the data for plotting
avg_metrics_long <- avg_metrics %>%
  gather(key = "Metric", value = "Value")

# Plot average daily activity metrics
ggplot(avg_metrics_long, aes(x = Metric, y = Value, fill = Metric)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Daily Activity Metrics", x = "Metric", y = "Value") +
  theme_minimal()
