#####################
# R function for downloading plain-text data from GitHub
# Christopher Gandrud
# 6 January 2013
#####################

source_GitHubData <- function(url, sep = ",", header = TRUE, ssl.verifypeer = TRUE)
{
  # Require RCurl Package
  require(RCurl)
  
  # Download data
  DataUrl <- getURL(UrlAddress, ssl.verifypeer = ssl.verifypeer)
  
  # Convert to data frame
  read.table(textConnection(DataUrl),
             sep = sep, header = header)
}