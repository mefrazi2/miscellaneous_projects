#################################################################

###                 How to Merge Datasets                     ###
###        More info: https://r-coder.com/merge-r/            ###

#################################################################

orig_lib <- read.csv("libraries_original.csv")

geo_lib <- read.csv("libraries_geocoded.csv")


# merge datasets
merged_df <- merge(orig_lib, geo_lib, by = c("NAME", "NAME"), all = TRUE)

# export csv
write.csv(merged_df, "all_addresses.csv")
