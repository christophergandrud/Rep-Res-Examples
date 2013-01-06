##############
# Create scatterplot matrix from MainData.csv
# Christopher Gandrud
# 6 January 2012
##############

Load package
library(RCurl)

# MainData.csv raw URl Address
UrlAddress <- "https://raw.github.com/christophergandrud/Rep-Res-Examples/master/DataGather_Merge/MainData.csv"

# Download MainData.csv
DataUrl <- getURL(UrlAddress)

# Convert DataURL into a data frame
MainData <- read.table(textConnection(DataUrl),
                          sep = ",", header = TRUE)

# Subset MainData so that it only includes 2003
SubData <- subset(MainData, year == 2003)

# Remove iso2c, country, year variables
# Keep reg_4state, disproportionality, FertilizerConsumption
SubData <- SubData[, c("reg_4state",
                       "disproportionality",
                       "FertilizerConsumption")]

# Create scatterplot matrix
pairs(x = SubData)