setwd("C:/Users/mfn2245/Desktop/Grace")
dir()

library(ncdf4)
library(raster)

# rest is fluff - only used for plotting within R
library(tidyr)
library(ggplot2)
library(ggmap)
library(viridis)
library(weathermetrics)
library(chron)
library(RColorBrewer)
library(lattice)

netCDF <- nc_open("avg_latlon2.nc")

# changing lat + long integer to character
netCDF$dim$latitude <- as.character(netCDF$dim$latitude)

netCDF$dim$longitude <- as.character(netCDF$dim$longitude)

# transform netCDF to raster
raster <- raster('avg_latlon2.nc', var = 'NO2')

# project raster
crs(raster) <- "+proj=lcc +lat_1=48 +lat_2=33 +lon_0=-100 +datum=WGS84"

# exporting raster 
ras_out <- (writeRaster(raster,"C:/Users/mfn2245/Desktop/Grace/no2_3.tif"))

# calling up lat and long dimensions for plotting - should be only 1 dimension
lon <- ncvar_get(no2, "longitude")
lat <- ncvar_get(no2, "latitude")

# selecting variable

no2_var <- ncvar_get(no2, "NO2")

no2_slice <- no2_var[,,,]
