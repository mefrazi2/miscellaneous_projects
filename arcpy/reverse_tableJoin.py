# Make Query Table (reverse tabular join)
# more info: https://community.esri.com/t5/arcgis-pro-questions/arcgis-pro-join-one-to-many-join-by-attribute/td-p/589401

# NOTE: in order for your script to function properly, you'll need to 1) create .gdb and 2) import layers involved in join

# set up - current environment and .gdb
import arcpy, os
from arcpy import env
env.overwriteOutput = True
env.workspace = r"C:\Users\NETID\Desktop\EBK & Vaccine Hesitancy\makeQueryTable.gdb"

# define layers/tables and variables
tableList = [r"C:\Users\NETID\Desktop\EBK & Vaccine Hesitancy\makeQueryTable.gdb\poly_output",\
r"C:\Users\NETID\Desktop\EBK & Vaccine Hesitancy\makeQueryTable.gdb\_grid_codes"]
whereClause = "poly_output.gridcode = _grid_codes.gridcode"
lyrName = "test"
outFeatureClass = "test_poly"

# run tool and make layer permanent
arcpy.management.MakeQueryTable(tableList, lyrName, "USE_KEY_FIELDS", "", "", whereClause)
arcpy.management.CopyFeatures(lyrName, outFeatureClass)