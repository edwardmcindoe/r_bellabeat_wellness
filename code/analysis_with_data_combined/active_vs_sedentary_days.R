# Active vs. Sedentary Days with units in the legend
threshold <- 10000

daily_activity_combined <- daily_activity_combined %>%
  mutate(DayType = ifelse(TotalSteps > threshold, "Active", "Sedentary"))

active_vs_sedentary_combined <- daily_activity_combined %>%
  group_by(DayType) %>%
  summarise(
    AvgTotalSteps = mean(TotalSteps, na.rm = TRUE),
    AvgTotalDistance = mean(TotalDistance, na.rm = TRUE) * 1000,  # Convert to meters
    AvgCalories = mean(Calories, na.rm = TRUE),
    AvgSedentaryMinutes = mean(SedentaryMinutes, na.rm = TRUE)
  )

active_vs_sedentary_combined %>%
  gather(key = "Metric", value = "Value", -DayType) %>%
  mutate(Metric = recode(Metric, 
                         "AvgTotalSteps" = "Average Total Steps", 
                         "AvgTotalDistance" = "Average Total Distance (meters)",
                         "AvgCalories" = "Average Calories",
                         "AvgSedentaryMinutes" = "Average Sedentary Minutes")) %>%
  ggplot(aes(x = DayType, y = Value, fill = DayType)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~ Metric, scales = "free_y") +
  labs(title = "Comparison of Metrics on Active vs. Sedentary Days", x = "Day Type", y = "Average Value") +
  theme_minimal()
