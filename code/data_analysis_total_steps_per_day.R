# Convert ActivityDate to Date type
daily_activity$ActivityDate <- mdy(daily_activity$ActivityDate)

# Plot total steps per day with formatted date axis
daily_activity %>%
  ggplot(aes(x = ActivityDate, y = TotalSteps)) +
  geom_line() +
  labs(title = "Total Steps per Day", x = "Date", y = "Total Steps") +
  scale_x_date(date_breaks = "1 week", date_labels = "%b %d") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

