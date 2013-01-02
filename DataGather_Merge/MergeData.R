######################
# Merge, final clean and save
# Christopher Gandrud
# 2 January 2013
######################

## This file merges three data frames created by:
## Gather1.R, Gather2.R, Gather3.R
## The data frames have the names:
## FinRegulatorData, DispropData, FertConsumpData

# Note: this code in this file is slightly different from the 
# example given in Chapter 7 of "Reproducible Research"

# Load library gdata
library(gdata)
library(reshape)

# Merge FinRegulatorData and DispropData
MergedData <- merge(
                    FinRegulatorData, DispropData,
                    union("iso2c", "year"),
                    all = TRUE)

# Merge combined data frame with FertConsumpData
MergedData <- merge(
                    MergedData, FertConsumpData,
                    union("iso2c", "year"),
                    all = TRUE)

# Created a data frame of duplicated country-years
DataNotDuplicates <- MergedData[!duplicated(
                                MergedData[, 1:2]), ]

# Remove country.y, country and idn
FinalCleanedData <- remove.vars(data = DataNotDuplicates,
                                names = c("country.y",
                                        "country",
                                        "idn"))

# Rename country.x = country
FinalCleanedData <- rename(x = FinalCleanedData,
                            replace = c(country.x =
                                        "country"))

# Save data frame as a CSV file
# Note that following command saves the file in the current working 
# directory. In the example from the book (Figure 4.1) it is saved
# in the Data directory. 
write.csv(FinalCleanedData, file = "MainData.csv")