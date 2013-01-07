###############
# Actual vs. Predicted United States Inflation ggplot2 line graph
# Christopher Gandrud
# 7 January 2013 
###############

# Load devtools
library(devtools)
library(reshape2)
library(ggplot2)

# Load source_GitHubData
source_gist("4466237")

# Create URL object
InflationUrl <- "https://raw.github.com/christophergandrud/Rep-Res-Examples/master/Graphs/InflationData.csv"

# Load data
InflationData <- source_GitHubData(InflationUrl)

# Melt InflationData
MoltenInflation <- melt(InflationData, id.vars = "Quarter",
                        measure.vars = c("ActualInflation",
                                         "EstimatedInflation"))

# Create plot
ggplot(data = MoltenInflation, aes(x = Quarter,
                                               y = value,
                                               color = variable,
                                               linetype = variable)) +
                    geom_line() +
                    scale_color_discrete(name = "") +
                    scale_linetype(name = "") +
                    xlab("\n Quarter") + ylab("Inflation\n") +
                    theme_bw(base_size = 15) 