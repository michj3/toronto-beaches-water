#### Preamble ####
# Purpose: Downloads and saves the data from OpenDataToronto
# Author: Michelle Ji
# Date: 10 September 2024
# Contact: michelle.ji@mail.utoronto.ca

#### Workspace set up ####

install.packages("tidyverse")
install.packages("opendatatoronto")
install.packages("dplyr")
library(tidyverse)
library(opendatatoronto)
library(dplyr)

#### Download data ####

# get package
package <- show_package("92b0de8f-1ada-44a7-84cf-adc04868e990")
package

# get all resources for this package
resources <- list_package_resources("92b0de8f-1ada-44a7-84cf-adc04868e990")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv'))

# load the first datastore resource as a sample
raw_beach_water_data <- filter(datastore_resources, row_number()==1) %>% get_resource()
raw_beach_water_data

#### Save data ####
write_csv(raw_beach_water_data, "inputs/data/raw_beach_water_data.csv")
