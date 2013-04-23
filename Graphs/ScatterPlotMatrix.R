##############
# Create scatterplot matrix from MainData.csv
# Christopher Gandrud
# 23 April 2012
##############

#  Load packages
library(devtools)
library(repmis)

# Load source_GitHubData
source_url("http://bit.ly/UOMkpd")

# Download data
MainData <- source_data("http://bit.ly/V0ldsf")

# Subset MainData so that it only includes 2003
SubData <- subset(MainData, year == 2003)

# Remove iso2c, country, year variables
# Keep reg_4state, disproportionality, FertilizerConsumption
SubData <- SubData[, c("reg_4state",
                       "disproportionality",
                       "FertilizerConsumption")]

# Create scatterplot matrix
pairs(x = SubData)
