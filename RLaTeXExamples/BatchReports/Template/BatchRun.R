###############
# Brew + Knit batch report of fertilizer consumption
# Christopher Gandrud
# 12 April 2013
# Requires Template/BrewTemplate.Rnw
##############

# Set working directory
## Change as needed
setwd("/git_repositories/Rep-Res-Examples/RLaTeXExamples/BatchReports/")

#### Download Data ####
# Load repmis
library(repmis)
                     
# Download data
MainData <- source_GitHubData("http://bit.ly/V0ldsf")

# Create vector of country names
COUNTRY <- as.character(unique(MainData$country))


#### Create BatchReports Function ####
BatchReports <- function(Name)
{
  # Create files namesfor individual reports 
  ## Remove white space in country names
  CountryNoWhite <- gsub(" ", "", x = Name)
  KnitFile <- paste0(CountryNoWhite, ".Rnw")

  # Subset data
  SubData <- subset(MainData, country == Name)
  
  # Create vector of the country's fertilizer consumption
  FC <- SubData$FertilizerConsumption

  # Brew and Knit
  brew::brew("Template/BrewTemplate.Rnw", KnitFile)
  knitr::knit2pdf(KnitFile)
}

#### Run function and clean up ####
plyr::l_ply(COUNTRY, BatchReports)

# Keep only pdf reports
unlink(c("*.aux", "*.log", "*.Rnw", "*.tex"))
