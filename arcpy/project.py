# project tool in arcpro
import arcpy

# input data
input_features = r"your_filepath"

# output data
output_feature_class = r"your_filepath"

# define output coordinate system
out_coor_system = arcpy.SpatialReference('NAD 1983 (2011) StatePlane Illinois East FIPS 1201 (US Feet)')

# run project tool
arcpy.management.Project(input_features, output_feature_class, out_coor_system)

print(arcpy.GetMessages())

print("table join finished")