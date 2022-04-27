# IPUMS NHGIS: Sourcing Data #

| Year      | Geography | Variable
| ----------- | ----------- | ----------- |
| 2018      | County     | Race       |
|           | ZIP      | Race       |
| 2019   | County        | Race       |
|    | ZIP        | Race       |


### 1. Register for [NHGIS](https://www.nhgis.org/) free account

### 2. Query results

    a. Geographic Level = County
    
    b. Years = 2018
    
    c. Topics = Race
    
    d. Datasets = 2018_ACS1*
   
### 3. Export results

     a. Unzip
     
     b. Codebook

### 4. Open ArcGIS Pro

     a. Bring in shp
     
     b. Join > GISJOIN to GISJOIN
     
     c. Validate

## Resources

1. [ACS Estimates & Comparisons Research Guide](https://libguides.northwestern.edu/census/acs#s-lg-box-28631976) 

2. [Join Analysis](https://pro.arcgis.com/en/pro-app/latest/tool-reference/data-management/add-join.htm)
