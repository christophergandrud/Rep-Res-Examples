###############
# Actual vs. Predicted United States Inflation ggplot2 line graph
# Christopher Gandrud
# 23 April 2013 
###############

# Load devtools
library(repmis)
library(reshape2)
library(ggplot2)

# Create URL object
InflationUrl <- "https://raw.github.com/christophergandrud/Rep-Res-Examples/master/Graphs/InflationData.csv"

# Load data
InflationData <- repmis::source_data(InflationUrl)

# Melt InflationData
MoltenInflation <- melt(InflationData, id.vars = "Quarter",
                        measure.vars = c("ActualInflation",
                                         "EstimatedInflation"))

# Create plot
LinePlot <- ggplot(data = MoltenInflation, aes(x = Quarter,
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
