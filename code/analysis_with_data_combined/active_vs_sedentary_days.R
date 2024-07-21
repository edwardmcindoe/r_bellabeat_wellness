# Define a threshold for active days (e.g., more than 10,000 steps)
threshold <- 10000

# Add a column to classify days as active or sedentary
daily_activity_combined <- daily_activity_combined %>%
  mutate(DayType = ifelse(TotalSteps > threshold, "Active", "Sedentary"))

# Compare metrics on active vs. sedentary days
active_vs_sedentary_combined <- daily_activity_combined %>%
  group_by(DayType) %>%
  summarise(
    AvgTotalSteps = mean(TotalSteps, na.rm = TRUE),
    AvgTotalDistance = mean(TotalDistance, na.rm = TRUE),
    AvgCalories = mean(Calories, na.rm = TRUE),
    AvgSedentaryMinutes = mean(SedentaryMinutes, na.rm = TRUE)
  )

# Plot comparison
active_vs_sedentary_combined %>%
  gather(key = "Metric", value = "Value", -DayType) %>%
  ggplot(aes(x = DayType, y = Value, fill = DayType)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~ Metric, scales = "free_y") +
  labs(title = "Comparison of Metrics on Active vs. Sedentary Days", x = "Day Type", y = "Average Value") +
  theme_minimal()
