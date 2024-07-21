# Aggregate data to find average metrics by day of the week
daily_activity_combined$Weekday <- weekdays(daily_activity_combined$ActivityDate)

avg_by_day_combined <- daily_activity_combined %>%
  group_by(Weekday) %>%
  summarise(
    AvgTotalSteps = mean(TotalSteps, na.rm = TRUE),
    AvgTotalDistance = mean(TotalDistance, na.rm = TRUE),
    AvgCalories = mean(Calories, na.rm = TRUE)
  )

# Plot average metrics by day of the week
avg_by_day_combined %>%
  gather(key = "Metric", value = "Value", -Weekday) %>%
  ggplot(aes(x = Weekday, y = Value, fill = Metric)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Average Metrics by Day of the Week", x = "Day of the Week", y = "Average Value") +
  theme_minimal()
