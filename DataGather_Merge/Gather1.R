################
# Download CSV file from Dropbox Public folder
# Christopher Gandrud
# Updated 11 April 2013
# Data from "The diffusion of financial supervisory governance ideas"
# (Gandrud 2012)
################

# Load packages
library(repmis)
library(countrycode)

# Place the URL into the object FinURL
FinURL <- "https://dl.dropbox.com/u/12581470/code/Replicability_code/Fin_Trans_Replication_Journal/Data/public.fin.msm.model.csv")

# Download data
FinRegulatorData <- source_data(FinURL,
                     sep = ",",
                     header = TRUE)

# Create standardized country ID numbers based iso 2 character codes
FinRegulatorData$iso2c <- countrycode(FinRegulatorData$country, 
					origin = "country.name",
					destination = "iso2c")

