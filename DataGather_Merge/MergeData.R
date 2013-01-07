######################
# Merge, final clean and save
# Christopher Gandrud
# 5 January 2013
######################

## This file merges three data frames created by:
## Gather1.R, Gather2.R, Gather3.R
## The data frames have the names:
## FinRegulatorData, DispropData, FertConsumpData

# Note: this code in this file is slightly different from the 
# example given in Chapter 7 of "Reproducible Research"

# Load libraries
library(gdata)
library(reshape)
library(xtable)

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

# Remove if FertilizerConsumption == 0
FertConsumpData <- subset(FertConsumpData, FertilizerConsumption != 0)

# Save data frame as a CSV file
# Note that following command saves the file in the current working 
# directory. In the example from the book (Figure 4.1) it is saved
# in the Data directory. 
write.csv(FinalCleanedData, file = "MainData.csv")

#### Create variable description file ####
# Vector of variable namess
Variable <- names(FinalCleanedData)

# Vector of variable descriptions
Description <- c("ISO 2 letter country code",
                 "observation year",
                 "country name",
                 "financial regulatory governance type",
                 "Gallagher Index of electoral disproportionality",
                 "Fertilizer consumption (kilograms per hectare of arable land)"
                 )

# Vector of variable sources
Sources <- c("",
             "",
             "",
             "Gandrud (2012)",
             "Gallagher (1991), Carey and Hix (2011)",
             "World Bank Development Indicators"
             )

# Combine vectors into a table
DescriptionsBound <- cbind(Variable, Description, Sources)

# Create an xtable object from Descriptions
DescriptionsTable <- xtable(DescriptionsBound)

# Format table in HTML
DescriptTable <- print.xtable(DescriptionsTable, type = "html")

cat("# Reproducible Research Example Data Set Variable Descriptions/Sources \n",
    DescriptTable,
    file = "MainData_VariableDescriptions.md"
)

