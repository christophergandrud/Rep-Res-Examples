################
# Download CSV file from GitHub
# Christopher Gandrud
# Updated 28 December 2012
# For more details abouth the data set see:
# http://christophergandrud.github.com/Disproportionality_Data/
################

# Load package
library(RCurl)

# Create UrlAddress object
UrlAddress <- ("https://raw.github.com/christophergandrud/ Disproportionality_Data/master/Disproportionality.csv")

# Pull data from the internet
DataUrl <- getURL(UrlAddress)

# Convert Data into a data frame
DispropData <- read.table(textConnection(DataUrl),
						  sep = ",", header = TRUE)

# Create standardized country ID numbers based iso 2 character codes
DispropData$iso2c <- countrycode(DispropData$country, 
									origin = "country.name",
									destination = "iso2c")