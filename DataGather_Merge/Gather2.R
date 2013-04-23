################
# Download CSV file from GitHub
# Christopher Gandrud
# Updated 2 January 2013
# For more details about the data set see:
# http://christophergandrud.github.com/Disproportionality_Data/
################

# Load package
library(repmis)
library(countrycode)

# Create UrlAddress object
UrlAddress <- ("https://raw.github.com/christophergandrud/Disproportionality_Data/master/Disproportionality.csv")

# Pull data from the internet
DataUrl <- source_data(UrlAddress)

# Create standardized country ID numbers based iso 2 character codes
DispropData$iso2c <- countrycode(DispropData$country, 
				origin = "country.name",
				destination = "iso2c")
