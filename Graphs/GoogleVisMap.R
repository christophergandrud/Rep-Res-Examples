##################
# Create a gvisGeoMap of Global Fertilizer Consumption
# Christopher Gandrud
# 7 January 2012
##################

#### Load data used in this document #### 
# Load packages
library(devtools)
library(googleVis)

# Load source_GitHubData function
source_gist("4466237")

# Load data from GitHub (http://bit.ly/V0ldsf)
## The data process used to create this data set
## is completely reproducible. For more information see:
## http://bit.ly/YnMKBG
MainData <- source_GitHubData("http://bit.ly/V0ldsf")

# Subset MainData so that it only includes 2003
SubData <- subset(MainData, year == 2003)

# Find the natural logarithm of FertilizerConsumption
SubData$LogConsumption <- log(SubData$FertilizerConsumption)

# Make a map of Fertilizer Consumption
FCMap <- gvisGeoMap(data = SubData,
                    locationvar = "iso2c",
                    numvar = "LogConsumption",
                    options = list(
                      colors = "[0xECE7F2, 0xA6BDDB, 0x2B8CBE]",
                      width = "780px",
                      height = "500px"))

# Print FCMap
print(FCMap, tag = "chart")