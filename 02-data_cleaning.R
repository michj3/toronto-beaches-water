#### Preamble ####
# Purpose: Cleans raw Toronto beaches water quality data obtained 
# in "01-download_data.R"
# Author: Michelle Ji
# Date: 11 September 2024
# Contact: michelle.ji@mail.utoronto.ca
# Pre-requisites: run 01-download_data.R

#### Loading packages ####
# install.packages("tidyverse")
# install.packages("opendatatoronto")

library(tidyverse)
library(opendatatoronto)

#### Cleaning the data set ####
# read file first
raw_beach_water_data <- read_csv("toronto-beaches-water/input/data/raw_beach_water_data.csv")

# select only rows of interest
beach_water_cleaned_data <- raw_beach_water_data |>
  select(X_id, beachId, beachName, siteName, 
         collectionDate, eColi, comments)

# if eColi levels are not in column, replace with "0"
beach_water_cleaned_data <- beach_water_cleaned_data |>
  mutate(eColi = if_else(is.na(eColi), 0, eColi))

# if there is a comment saying "no data" for a beach on a specific 
# date, remove that data point 
beach_water_cleaned_data <- beach_water_cleaned_data |>
  filter(comments != "No data")

# get rid of comments column, as it is unneeded now
beach_water_cleaned_data <- beach_water_cleaned_data |>
  select(X_id, beachId, beachName, siteName, 
         collectionDate, eColi)

# rename column headers for clarity
beach_water_cleaned_data <- beach_water_cleaned_data |>
  rename("Observation" = "X_id",
         "Beach Number" = "beachId",
         "Beach Name" = "beachName",
         "Site Location" = "siteName",
         "Collection Date" = "collectionDate",
         "E. Coli Levels (# colonies/ 100mL)" = "eColi")

# save cleaned data
write_csv(beach_water_cleaned_data, "toronto-beaches-water/input/data/
          beach_water_cleaned_data.csv")
