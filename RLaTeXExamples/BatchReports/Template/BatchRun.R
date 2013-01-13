

setwd("/git_repositories/Rep-Res-Examples/RLaTeXExamples/BatchReports/")

# Load source_GitHubData
devtools::source_url("http://bit.ly/TSwJVM")
                     
# Download data)
MainData <- source_GitHubData("http://bit.ly/V0ldsf")

# Create vector of country names
COUNTRY <- as.character(unique(MainData$country))

COUNTRY <- COUNTRY[!is.na(COUNTRY)]

BatchReports <- function(Name)
{
  # Create files namesfor individual reports 
  ## Remove white space in country names
  CountryNoWhite <- gsub(" ", "", x = Name)
  KnitFile <- paste0(CountryNoWhite, ".Rnw")

  # Subset data
  SubData <- subset(MainData, country == Name)
  
  # Create vector of the country's fertilizer consumption
  X <- SubData$FertilizerConsumption

  # Brew and Knit
  brew::brew("Template/BrewTemplate.Rnw", KnitFile)
  knitr::knit2pdf(KnitFile)
  #return(KnitFile)
}

# Run function
plyr::l_ply(COUNTRY, BatchReports)

# Keep only pdf reports
unlink(c("*.aux", "*.log", "*.Rnw", "*.tex"))

# unlink("*.pdf")