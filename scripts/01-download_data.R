#### Preamble ####
# Purpose: Downloads and saves the data from OpenDataToronto
# Author: Michelle Ji
# Date: 10 September 2024
# Contact: michelle.ji@mail.utoronto.ca

#### Work space set up ####

library(tidyverse)
library(opendatatoronto)
library(dplyr)

#### Download data ####

# get package
package <- show_package("92b0de8f-1ada-44a7-84cf-adc04868e990")
package

# get all resources for this package
resources <- list_package_resources("92b0de8f-1ada-44a7-84cf-adc04868e990")

# identify data store resources; by default, Toronto Open Data sets
#data store resource format to CSV for non-geospatial and GeoJSON
# for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c("csv"))

# load the first data store resource as a sample
raw_beach_water_data <- filter(datastore_resources, row_number() == 1) %>%
  get_resource()
raw_beach_water_data

#### Save data ####
write_csv(raw_beach_water_data, "toronto-beaches-water/input/data/data.csv")
