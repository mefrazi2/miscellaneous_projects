import ee
from ee_plugin import Map

# call in dataset
dataset = ee.ImageCollection('NOAA/VIIRS/DNB/MONTHLY_V1/VCMSLCFG')

# define bands + filter dates
nighttime = dataset.select('avg_rad').filterDate('2022-01-30','2022-06-30')

# summarizing pixels by median
median = nighttime.median()

# create visualizations - you can change the min and max spectrum
nighttimeVis = {'min': 0, 'max': 60};

# add layer to map
Map.addLayer(median, nighttimeVis, 'nighttime')