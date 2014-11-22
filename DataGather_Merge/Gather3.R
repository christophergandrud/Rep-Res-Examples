################
# Download Agricultural methane emissions (% of total) from WDI
# Christopher Gandrud
# Updated 21 November 2014
################

# Load WDI
library(WDI)
library(dplyr)

# Note: Fertilizer consumption/hectare of arable land indicator number:
# AG.CON.FERT.ZS

# Note: for simplicity that this example does not include
# all of the clean up  procedures covered in Chapter 7 of "Reproducible Research"

# Gather agricultural methane emissions data from WDI
FertConsumpData <- WDI(indicator = "AG.CON.FERT.ZS",
                        start = 1987, end = 2011)

# Rename variable = year, value = FertilizerConsumption
FertConsumpData <- rename(FertConsumpData,
                        FertilizerConsumption = AG.CON.FERT.ZS)

# Subset NA FertilizerConsumption values
FertConsumpData <- subset(FertConsumpData, !is.na(FertilizerConsumption))
