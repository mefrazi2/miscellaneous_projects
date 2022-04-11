import arcpy 
from arcpy import env
from arcpy.sa import *

env.workspace = "C:/Users/Desktop/reclass_data"
inRaster = "C:/Users/Desktop/reclass_data/ebk.tif"
reclassField = "VALUE"

# first is variable, can be string, second is the int your reclassifying as
remap = RemapValue ([[0.494846, 1],
[0.81637, 23379],
[0.819229, 23380],
[0.819242, 23381],
[0.819782, 23382],
[0.82011, 23383],
[0.827907, 23384],
[0.830895, 23385],
[0.834933, 23386]])

outReclassify = Reclassify(inRaster, reclassField, remap, 'NODATA')
