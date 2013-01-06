###############
# Actual vs. Predicted United States Inflation 
# Christopher Gandrud
# 6 January 2013 
###############

# Load libraries
library(RCurl)
library(reshape2)
library(ggplot2)

### Load data

# Load data from GitHub
url <- "https://raw.github.com/christophergandrud/GreenBook/master/Data/GB_FRED_cpi_2006.csv"
cpi.data <- getURL(url)
cpi.data <- read.csv(textConnection(cpi.data))

##### Create DV, Other Cleaning ########

# Create presidential party factor variable
cpi.data$pres_party_name <- factor(cpi.data$pres_party, label = c("Rep", "Dem"))

# Create standardized forecast error variable
cpi.data$error.prop.deflator.q0 <-  (cpi.data$GB_CPI_QTR0 - cpi.data$deflator)/cpi.data$deflator
cpi.data$error.prop.deflator.q1 <-  (cpi.data$GB_CPI_QTR1 - cpi.data$deflator)/cpi.data$deflator
cpi.data$error.prop.deflator.q2 <-  (cpi.data$GB_CPI_QTR2 - cpi.data$deflator)/cpi.data$deflator
cpi.data$error.prop.deflator.q3 <-  (cpi.data$GB_CPI_QTR3 - cpi.data$deflator)/cpi.data$deflator
cpi.data$error.prop.deflator.q4 <-  (cpi.data$GB_CPI_QTR4 - cpi.data$deflator)/cpi.data$deflator
cpi.data$error.prop.deflator.q5 <-  (cpi.data$GB_CPI_QTR5 - cpi.data$deflator)/cpi.data$deflator

# Create FRB/Global Model Variable 
cpi.data$GlobalModel[cpi.data$Quarter > 1995.4] <- "1"
cpi.data$GlobalModel[cpi.data$Quarter < 1996.1] <- "0"
cpi.data$GlobalModel <- factor(cpi.data$GlobalModel, labels = c("Before 1996", "After 1996"))  

# Create Fed Chair variable
cpi.data$Chair[cpi.data$Quarter > 1987.3] <-  "Greenspan"
cpi.data$Chair[cpi.data$Quarter > 2005.4] <-  "Bernanke"
cpi.data$Chair[cpi.data$Quarter <= 1987.3] <- "Volcker"
cpi.data$Chair[cpi.data$Quarter <= 1979.3] <- "Miller"
cpi.data$Chair[cpi.data$Quarter <= 1978.1] <- "Burns"
cpi.data$Chair[cpi.data$Quarter <= 1970.1] <- "Martin"
cpi.data$Chair <- factor(cpi.data$Chair)

## Remove 2 quarters from Johnson presidency
cpi.data <- subset(cpi.data, president != "Johnson")

cpi.data$presTerm <- as.factor(cpi.data$presTerm)

## Other data loading options
#cpi.data <- read.csv("/git_repositories/GreenBook/Data/GB_FRED_cpi.csv") # Load data locally from Christopher's computer
# cpi.data <- read.dta("http://dl.dropbox.com/u/12581470/code/Replicability_code/GreenBook/GB_FRED_cpi.dta") # Load data from Dropbox 

##### Create Plot #######
### Melt data, i.e. reshape
cpi.abs <- melt(cpi.data, id = "Quarter", measure = c("GB_CPI_QTR2", "deflator"))

### Rename variables
cpi.abs$variable <- gsub("GB_CPI_QTR2", "Forecast", cpi.abs$variable)
cpi.abs$variable <- gsub("deflator", "Actual", cpi.abs$variable)

### Colours
absolute.colors <- c("Forecast" = "#B35B40", "Actual" = "#000000")

### Create line graph
absInflation <- qplot(Quarter, value, geom = "line", data = cpi.abs, color = variable, linetype = variable) +
  xlab("") + ylab("Inflation\n") +
  scale_color_manual(values = absolute.colors, name = "") +
  scale_linetype(name = "") + 
  scale_x_continuous(limits = c(1968, 2007),
                     breaks = c(1970, 1980, 1990, 2000, 2007), 
                     labels = c(1970, 1980, 1990, 2000, 2007)) +
  geom_vline(aes(xintercept = 1996), linetype = "dotted", colour = "grey50") +
  annotate("text", x = 2001, y = 8.5, label = "FRB/Global", colour = "grey50") +
  geom_vline(aes(xintercept = 1975), linetype = "dotted", colour = "grey50") +
  annotate("text", x = 1978, y = 1.5, label = "SEM", colour = "grey50") +
  theme_bw(base_size = 12)

print(absInflation)