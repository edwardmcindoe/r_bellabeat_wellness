# Load necessary libraries
library(tidyverse)
library(lubridate)

# Define file paths
file_path1 <- "C:/Users/edwar/OneDrive/Documents/Data_Analysis_Development/r_bellabeat_wellness/raw_data/mturkfitbit_export_3.12.16-4.11.16/Fitabase Data 3.12.16-4.11.16/dailyActivity_merged.csv"

file_path2 <- "C:/Users/edwar/OneDrive/Documents/Data_Analysis_Development/r_bellabeat_wellness/raw_data/mturkfitbit_export_4.12.16-5.12.16/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv"

# Read the CSV files into data frames
daily_activity1 <- read_csv(file_path1)
daily_activity2 <- read_csv(file_path2)

# Combine the datasets
daily_activity_combined <- bind_rows(daily_activity1, daily_activity2)

# Convert ActivityDate to Date type
daily_activity_combined$ActivityDate <- mdy(daily_activity_combined$ActivityDate)
