

# Load source_GitHubData
devtools::source_url("http://bit.ly/UOMkpd")
                     
# Download data)
MainData <- source_GitHubData("http://bit.ly/V0ldsf")

# Create vector of country names
COUNTRY <- as.character(unique(MainData$country))

COUNTRY <- COUNTRY[!is.na(COUNTRY)]

BatchReports <- function(Name)
{
  #### Set Up ####
  # Create directory to save reports in
  dir.create("ReportsTemp")
  dir.create("Reports")
  # Create files for individual reports
  KnitFile <- paste0("ReportsTemp/", Name, ".Rnw")
  PDF <- paste0("Reports/", Name)
  
  # Subset data
  SubData <- subset(MainData, country == Name)
  
  # Create vector of the country's fertilizer consumption
  X <- SubData$FertilizerConsumption

  # Brew and Knit
  brew::brew("BrewTemplate.Rnw", KnitFile)
  knitr::knit2pdf(KnitFile, PDF)
  return(KnitFile)
}

setwd("/git_repositories/Rep-Res-Examples/RLaTeXExamples/BatchReport/")
lapply(COUNTRY, BatchReports)