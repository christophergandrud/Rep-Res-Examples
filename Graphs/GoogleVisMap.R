##################
# Create a gvisGeoMap of Global Fertilizer Consumption
# Christopher Gandrud
# 23 December 2014
##################

#### Load data used in this document #### 
# Load packages
library(devtools)
library(googleVis)
library(repmis)

# Load data from GitHub (http://bit.ly/V0ldsf)
## The data gathering process used to create this data set
## is completely reproducible. For more information see:
## http://bit.ly/YnMKBG
MainData <- source_data("http://bit.ly/V0ldsf")

# Subset MainData so that it only includes 2003
SubData <- subset(MainData, year == 2003)

# Remove values of FertilizerConsumption less than 0.1
SubData <- subset(SubData, FertilizerConsumption > 0.1)

# Find the natural logarithm of FertilizerConsumption.
## Round the results to one decimal digit.
SubData$LogConsumption <- round(log(SubData$FertilizerConsumption),
                                digits = 1)

# Make a map of Fertilizer Consumption
FCMap <- gvisGeoChart(data = SubData,
                    locationvar = "iso2c",
                    colorvar = "LogConsumption",
                    options = list(
                      colors = "['#ECE7F2', '#A6BDDB', '#2B8CBE']",
                      width = "780px",
                      height = "500px"))

# Print FCMap
print(FCMap, tag = "chart")
