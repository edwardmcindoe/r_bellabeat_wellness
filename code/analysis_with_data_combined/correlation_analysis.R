# Correlation Heatmap
library(ggcorrplot)

cor_matrix_combined <- daily_activity_combined %>%
  select(TotalSteps, TotalDistance, Calories, SedentaryMinutes, LightlyActiveMinutes, FairlyActiveMinutes, VeryActiveMinutes) %>%
  cor(use = "complete.obs")

ggcorrplot(cor_matrix_combined, lab = TRUE) +
  labs(title = "Correlation Matrix of Activity Metrics")
