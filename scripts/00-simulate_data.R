#### Preamble ####
# Purpose: Simulates and tests simulated data for beach water quality 
# for 2 Toronto beaches
# Author: Michelle Ji
# Date: 12 September 2024
# Contact: michelle.ji@mail.utoronto.ca
# Pre-requisites: access and read beach_water_cleaned_data.csv

#### Work space set up ####
# install.package(tidyverse)
library(tidyverse)

#### Simulate data ####

set.seed(3)

# Want to simulate 100 observations with randomizing date, beach, and 
# E. Coli level

# Before simulating, we must give the range of the dates in the original data set
start_date <- as.Date("2007-06-03")
end_date <- as.Date("2024-09-08")
date_range <- seq(start_date, end_date, by = "day")

simulated_beach_water_data <- 
  tibble(
    # Simulating 100 observations
    "Observation" = 1:100,
    
    # Randomly simulating a date in the data set range, 1000 times
    
    "Collection Date" = sample(
      x = date_range, 
      size = 100,
      replace = TRUE),
    
    # Randomly picking between the 2 beaches in the data set 1000 times
    "Beach Name" = sample(
      x = c("Marie Curtis Park East Beach", "Sunnyside Beach"),
      size = 100,
      replace = TRUE),
    
    # Randomly simulating an E. Coli level, 1000 times
    "E. Coli Level (# colonies/100mL)" = sample(
      x = 0:6191768,
      size = 100,
      replace = TRUE),
)

#### Testing Simulated Data ####

# Testing if there are only 2 beaches present
simulated_beach_water_data$`Beach Name` |> 
  unique() |>
  sort() == sort(c("Marie Curtis Park East Beach", "Sunnyside Beach"))

length(unique(simulated_beach_water_data$`Beach Name`)) == 2

# Testing to see if the E. Coli levels are within the actual range from data set
max_ecoli_level <- 6191768
min_ecoli_level <- 0

simulated_beach_water_data$`E. Coli Level (# colonies/100mL)` >= min_ecoli_level & 
  simulated_beach_water_data$`E. Coli Level (# colonies/100mL)` <= max_ecoli_level

# Test to see if simulated dates fall within the range of original data set
earliest_date <- as.Date("2007-06-03")
latest_date <- as.Date("2024-09-08")

simulated_beach_water_data$`Collection Date` >= earliest_date &
  simulated_beach_water_data$`Collection Date` <= latest_date

# Testing classes 
simulated_beach_water_data$Observation |> class() == "integer"
simulated_beach_water_data$`Collection Date` |> class() == "Date"
simulated_beach_water_data$`Beach Name` |> class () == "character"
simulated_beach_water_data$`E. Coli Level (# colonies/100mL)` |> class() == "integer"

# Test to see if there are duplicated rows 
num_duplicates_rows <- sum(duplicated(simulated_beach_water_data) | 
                             duplicated(simulated_beach_water_data, 
                                        fromLast = TRUE))
num_duplicates_rows == 0
