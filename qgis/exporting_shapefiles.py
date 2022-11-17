### How to export shapefiles using Python in QGIS ###

## resource: https://www.youtube.com/watch?v=dN2RHKYzJ0M

# identify shapefile for duplication
layers = QgsProject.instance().mapLayersByName('community_areas')

# calling first layer in list
layer = layers[0]

#identify filename w/ .shp extension 
fn = 'C:/Users/mfn2245/OneDrive - Northwestern University/Desktop/dup_6.shp'

# write the new file parameters - captialization matters
writer = QgsVectorFileWriter.writeAsVectorFormat(layer, fn, 'utf-8', driverName='ESRI Shapefile')

# add new layer to map
selected_layer = iface.addVectorLayer(fn, '', 'ogr')