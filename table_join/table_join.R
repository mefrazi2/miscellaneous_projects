# ICPSR | Global Economy Map Tutorial 

# Set up
setwd("C:/Users/mfn2245/Desktop/")

library(rnaturalearth)
library(rnaturalearthdata)
library(readxl)
library(dplyr)
library(sf)
library(tmap)

# Load ICPSR data into R Studio
covid_data <- read_excel("Gov_Responses2Covid19_last.xlsx", sheet = "Dataset")

# Bring spatial dataset of country boundaries into R environment using rnaturalearth package
country_boundaries <- ne_countries(scale = "medium", returnclass = "sf") %>% st_make_valid()

# Move "geometry" column to the beginning of the "country_boundaries" dataset
View(relocate(country_boundaries, geometry))

# maps geographic features (i.e. countries) of "country_boundaries" using tmap package functions
worldmap <- tm_shape(country_boundaries) +
  tm_polygons()

# Deletes Antarctica from "country_boundaries"
# Remember %>% as a pipe that strings code together by taking the output to the left and passing it as input to the right
country_boundaries<-country_boundaries %>% filter(iso_a3 !="ATA")

worldmap <- tm_shape(country_boundaries) +
  tm_polygons()

# ascertain dimensions of "covid_data" object
dim(covid_data)  

# Select "iso" and "Economic_Measures" columns from "covid_data" dataset, and assign the dataset created through this selection to the "covid_data_economic" object
covid_data_economic <- covid_data %>% 
  select(iso, Economic_Measures) 

# Find the class of the "Economic_Measures" field within the "covid_data_economic" dataset
class(covid_data_economic$Economic_Measures)

# Changes class of "Economic_Measures" field in "covid_data_economic" object from character to numeric
covid_data_economic$Economic_Measures <- as.numeric(covid_data_economic$Economic_Measures)

# Creates new dataset of country-level averages for "Economic_Measures" index, and then assigns this new dataset to a  new object that is named "covid_data_economic_avg".
# Remember na.rm=TRUE is Boolean phrase meaning to remove all NA elements
covid_data_economic_avg <- covid_data_economic %>% group_by(iso) %>% 
  summarize(mean_economic=mean(Economic_Measures, na.rm=TRUE))