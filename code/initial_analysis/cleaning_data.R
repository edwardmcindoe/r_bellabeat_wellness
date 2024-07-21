# Check for missing values
sum(is.na(daily_activity))

# Display rows with missing values if any
daily_activity %>% filter_all(any_vars(is.na(.)))
