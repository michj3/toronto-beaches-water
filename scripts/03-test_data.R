#### Preamble ####
# Purpose: Simulates and tests cleaned data for beach water quality
# for 2 Toronto beaches
# Author: Michelle Ji
# Date: 13 September 2024
# Contact: michelle.ji@mail.utoronto.ca
# Pre-requisites: access and read beach_water_cleaned_data.csv

#### Work space set up ####
library(tidyverse)

#### Test cleaned data ####

# Testing if there are only 2 beaches present
beach_water_cleaned_data$`Beach Name` |>
  unique() |>
  sort() == sort(c("Marie Curtis Park East Beach", "Sunnyside Beach"))

length(unique(beach_water_cleaned_data$`Beach Name`)) == 2

# Testing to see if the E. Coli levels are within the actual range from data set
max_ecoli_level <- 6191768
min_ecoli_level <- 0

beach_water_cleaned_data$`E. Coli Levels (# colonies/100mL)` >=
  min_ecoli_level & beach_water_cleaned_data$
  `E. Coli Levels (# colonies/100mL)` <= max_ecoli_level

# Test to see if simulated dates fall within the range of original data set
earliest_date <- as.Date("2007-06-03")
latest_date <- as.Date("2024-09-08")

beach_water_cleaned_data$`Collection Date` >= earliest_date &
  beach_water_cleaned_data$`Collection Date` <= latest_date

# Testing classes
beach_water_cleaned_data$Observation |> class() == "integer"
beach_water_cleaned_data$`Collection Date` |> class() == "Date"
beach_water_cleaned_data$`Beach Name` |> class() == "character"
beach_water_cleaned_data$`E. Coli Level (# colonies/100mL)` |>
  class() == "integer"
# Test to see if there are duplicated rows
num_duplicates_rows <- sum(duplicated(beach_water_cleaned_data) |
                             duplicated(beach_water_cleaned_data,
                                        fromLast = TRUE))
num_duplicates_rows == 0
