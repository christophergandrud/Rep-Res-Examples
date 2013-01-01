######################
# Merge and Save
# Christopher Gandrud
# 1 January 2013
######################

## This file merges three data frames created by:
## Gather1.R, Gather2.R, Gather3.R
## The data frames have the names:
## FinRegulatorData, DispropData, FertConsumpData

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

# Save data frame as a CSV file
write.csv(MergedData, file = "MergedData.csv")