# Load necessary libraries
library(tidyverse)
library(lubridate)

# Define the file path
file_path <- "C:/Users/edwar/OneDrive/Documents/Data_Analysis_Development/r_bellabeat_wellness/raw_data/mturkfitbit_export_3.12.16-4.11.16/Fitabase Data 3.12.16-4.11.16/dailyActivity_merged.csv"

# Read the CSV file into a data frame
daily_activity <- read_csv(file_path)

# Display the first few rows of the data frame
head(daily_activity)

# Display the structure of the data frame
str(daily_activity)

# Summary statistics of the data
summary(daily_activity)
