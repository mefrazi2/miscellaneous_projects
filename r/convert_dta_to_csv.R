### converting stata files into csv ###

library(tidyverse)
library(haven)

zipcodes <- read_dta("zipcodes.dta")

write.csv(zipcodes, "zipcodes.csv")