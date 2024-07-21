# Calculate correlation matrix
cor_matrix_combined <- daily_activity_combined %>%
  select(TotalSteps, TotalDistance, Calories, SedentaryMinutes, LightlyActiveMinutes, FairlyActiveMinutes, VeryActiveMinutes) %>%
  cor(use = "complete.obs")

# Print the correlation matrix
print(cor_matrix_combined)

# Plot the correlation matrix
library(ggcorrplot)
ggcorrplot(cor_matrix_combined, lab = TRUE)
