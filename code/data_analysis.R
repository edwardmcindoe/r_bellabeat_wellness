# Plot total steps per day
daily_activity %>%
  ggplot(aes(x = ActivityDate, y = TotalSteps)) +
  geom_line() +
  labs(title = "Total Steps per Day", x = "Date", y = "Total Steps")

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

# Convert ActivityDate to Date type
daily_activity$ActivityDate <- mdy(daily_activity$ActivityDate)

# Plot total steps per day with formatted date axis
daily_activity %>%
  ggplot(aes(x = ActivityDate, y = TotalSteps)) +
  geom_line() +
  labs(title = "Total Steps per Day", x = "Date", y = "Total Steps") +
  scale_x_date(date_breaks = "1 week", date_labels = "%b %d") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

