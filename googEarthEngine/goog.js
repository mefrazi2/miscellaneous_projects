// how to get started using Google Earth Engine

// SINGLE BAND

// define slope variable using the imported srtm data
var slope = ee.Terrain.slope(srtm);

// add layers to map, define parameters - pay attention to min-max values
Map.addLayer(srtm, {min:0, max:1000, palette:'black, white'},'srtm', false);
Map.addLayer(slope, {min:0, max:60}, 'slope', true);
Map.addLayer(water, {bands:'occurrence', min:0, max:100, palette: "lightblue, blue"}, 'water', true);

// calculate slope for a given region using the geometry/polygon tool
// you need to define the polygon first before running this
// define geometry if you change the name, or have mulitiple
var slopeDict = slope.reduceRegion({
  reducer: ee.Reducer.mean(),
  geometry: geometry, 
  scale: 30
});

print(slopeDict, 'slopeDict');

// calculating the area of water occurrence that's present 90% or more in this capture
// square meters
var waterDict = water.select('occurrence').gt(90)
  .multiply(ee.Image.pixelArea())
  .reduceRegion({
    reducer: ee.Reducer.sum(),
    geometry: geometry,
    scale: 30
  });
  
print(waterDict, 'waterDict');

// MULTI-BAND

var filtered = L8.filterDate('2022-05-01', '2022-05-15');

// print(filtered.size());

// red, green, blue composite image
Map.addLayer(
  filtered,
  {min:0, max:0.3, bands: ['B4', 'B3', 'B2']},
  'true color',
  false
  );

// near-infared image 
// B5 band is near infared - vegetation has a high-reflective signature at this spectrum
// check out: https://www.usgs.gov/media/images/common-landsat-band-combinations 
  Map.addLayer(
  filtered,
  {min:0, max:0.3, bands: ['B5','B4', 'B3']},
  'false color',
  false
  );
  
// create constant for spectral bands
var RGB_VIZ = {min:0, max:0.3, bands: ['B4', 'B3', 'B2']};

// image w/ noise
// long date range gets you better results
var filtered1 = L8.filterDate('2022-03-01', '2022-05-15')

Map.addLayer(filtered1, RGB_VIZ, 'median1');

// reducing noise by applying median function
// median pixel value from all composite layers
Map.addLayer(filtered1.median(), RGB_VIZ, 'median2');

// minimum reducer is better for clouds, but not great for shadows
// try expanding your date range to get cloud-less images
Map.addLayer(filtered1.min(), RGB_VIZ, 'median3');