# table join in ArcPro 
import arcpy

# set workspace (alternatively create variables with file path)
# ex: "C:/Users/mfn2245/Desktop/tbd/Default.gdb"
arcpy.env.workspace = "your_filepath" 

# create variables (way easier)
# note: the join field needs to be the same, or label it as "joinInputField" and "joinTableField"
inFeatures = "your_input_feature"
joinField = "your_joining_field"
joinTable = "your_table"

# using hashtags denotes default settings
# same joining field: 
arcpy.management.JoinFields(inFeatures, joinField, joinTable, '#')

# different joining fields:
arcpy.management.JoinFields(inFeatures, joinInputField, joinTable, joinTableField, '#')

# get messages about tool execution; useful for error messages
print(arcpy.GetMessages())

print("table join finished")