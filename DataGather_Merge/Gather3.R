################
# Download Agricultural methane emissions (% of total) from WDI
# Christopher Gandrud
# Updated 7 January 2013
################

# Load WDI
library(WDI)
library(reshape)

# Note: Fertilizer consumption/hectare of arable land indicator number:
# AG.CON.FERT.ZS

# Note: for simplicity that this example does not include 
# all of the clean up  procedures covered in Chapter 7 of "Reproducible Research"

# Gather agricultural methane emissions data from WDI
FertConsumpData <- WDI(indicator = "AG.CON.FERT.ZS")

# Rename variable = year, value = FertilizerConsumption
FertConsumpData <- rename(x = FertConsumpData,
                     replace = c(AG.CON.FERT.ZS
                     			 = "FertilizerConsumption"))