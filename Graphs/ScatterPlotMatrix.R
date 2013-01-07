##############
# Create scatterplot matrix from MainData.csv
# Christopher Gandrud
# 7 January 2012
##############

#  Load devtools
library(devtools)

# Load source_GitHubData
source_url("http://bit.ly/UOMkpd")

# Download data
MainData <- source_GitHubData("http://bit.ly/V0ldsf")

# Subset MainData so that it only includes 2003
SubData <- subset(MainData, year == 2003)

# Remove iso2c, country, year variables
# Keep reg_4state, disproportionality, FertilizerConsumption
SubData <- SubData[, c("reg_4state",
                       "disproportionality",
                       "FertilizerConsumption")]

# Create scatterplot matrix
pairs(x = SubData)