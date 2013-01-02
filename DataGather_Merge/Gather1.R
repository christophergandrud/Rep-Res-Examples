################
# Download CSV file from Dropbox
# Christopher Gandrud
# Updated 28 December 2012
# Data from "The diffusion of financial supervisory governance ideas"
# (Gandrud 2012)
################

# Load library
library(countrycode)

# Download financial regulatory variables
FinRegulatorData <- read.table("http://bit.ly/PhjaPM",
                    		sep = ",", header = TRUE)

# Create standardized country ID numbers based iso 2 character codes
FinRegulatorData$iso2c <- countrycode(FinRegulatorData$country, 
									origin = "country.name",
									destination = "iso2c")

names(FinRegulatorData)