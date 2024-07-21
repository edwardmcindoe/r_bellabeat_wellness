# Display the first few rows of the combined data frame
head(daily_activity_combined)

# Display the structure of the combined data frame
str(daily_activity_combined)

# Summary statistics of the combined data
summary(daily_activity_combined)

# Check for missing values
sum(is.na(daily_activity_combined))

# Display rows with missing values if any
daily_activity_combined %>% filter_all(any_vars(is.na(.)))
