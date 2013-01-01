################
# Download Agricultural methane emissions (% of total) from WDI
# Christopher Gandrud
# Updated 31 December 2012
################

# Load WDI
library(WDI)

# Note: Fertilizer consumption/hectare of arable land indicator number:
# AG.CON.FERT.ZS

# Gather agricultural methane emissions data from WDI
FertConsumpData <- WDI(indicator = "AG.CON.FERT.ZS")