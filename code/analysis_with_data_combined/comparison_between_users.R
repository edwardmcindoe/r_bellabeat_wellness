# Calculate average metrics per user
avg_by_user_combined <- daily_activity_combined %>%
  group_by(Id) %>%
  summarise(
    AvgTotalSteps = mean(TotalSteps, na.rm = TRUE),
    AvgTotalDistance = mean(TotalDistance, na.rm = TRUE),
    AvgCalories = mean(Calories, na.rm = TRUE)
  )

# Plot comparison of average total steps per user
avg_by_user_combined %>%
  ggplot(aes(x = Id, y = AvgTotalSteps, fill = Id)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Total Steps per User", x = "User ID", y = "Average Total Steps") +
  theme_minimal()
