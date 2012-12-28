################
# Download Agricultural methane emissions (% of total) from WDI
# Christopher Gandrud
# Updated 28 December 2012
################

# Note: Agricultural methane emissions (% of total) indicator number:
# EN.ATM.METH.AG.ZS

# Gather agricultural methane emissions data from WDI
AgMethaneData <- WDI(indicator = "EN.ATM.METH.AG.ZS")