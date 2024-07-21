# Calculate and plot average daily activity metrics with scaled TotalDistance
avg_metrics_scaled <- daily_activity %>%
  summarise(
    AvgTotalSteps = mean(TotalSteps, na.rm = TRUE),
    AvgTotalDistance = mean(TotalDistance, na.rm = TRUE) * 1000,  # Scale up distance for visibility
    AvgCalories = mean(Calories, na.rm = TRUE)
  )

# Print the average metrics to check values
print(avg_metrics_scaled)

# Reshape the data for plotting
avg_metrics_long_scaled <- avg_metrics_scaled %>%
  gather(key = "Metric", value = "Value")

# Plot average daily activity metrics with scaled distance
ggplot(avg_metrics_long_scaled, aes(x = Metric, y = Value, fill = Metric)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Daily Activity Metrics", x = "Metric", y = "Value (Distance in meters)") +
  theme_minimal()


