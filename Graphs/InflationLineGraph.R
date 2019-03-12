###############
# Actual vs. Predicted United States Inflation ggplot2 line graph
# Christopher Gandrud
# 13 January 2014
###############

# Load devtools
library(rio)
library(tidyr)
library(ggplot2)

# Create URL object
InflationUrl <- "https://raw.github.com/christophergandrud/Rep-Res-Examples/master/Graphs/InflationData.csv"

# Load data
InflationData <- import(InflationUrl, format = "csv")

# Gather InflationData
GatheredInflation <- gather(InflationData, variable, value, 2:3)

# Create plot
LinePlot <- ggplot(data = GatheredInflation, aes(x = Quarter,
                                               y = value,
                                               color = variable,
                                               linetype = variable)) +
                    geom_line() +
                    scale_color_discrete(name = "", labels = c("Actual", 
                                                               "Estimated")) +
                    scale_linetype(name = "", labels = c("Actual", 
                                                         "Estimated")) +
                    xlab("\n Quarter") + ylab("Inflation\n") +
                    theme_bw(base_size = 15) 

# Print plot
print(LinePlot)
