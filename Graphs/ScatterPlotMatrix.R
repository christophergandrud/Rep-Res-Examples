##############
# Create scatterplot matrix from MainData.csv
# Christopher Gandrud
# 29 September 2019
##############

#  Load packages
library(devtools)

# Download data
main_data <- rio::import("http://bit.ly/V0ldsf",
                        format = "csv" )

# Subset main_data so that it only includes the year 2003
data_sub <- subset(main_data, year == 2003)

# Remove iso2c, country, year variables
# Keep reg_4state, disproportionality, FertilizerConsumption
data_sub <- data_sub[, c("reg_4state", "disproportionality",
                       "FertilizerConsumption")]

# Create a scatterplot matrix
pairs(x = data_sub)
