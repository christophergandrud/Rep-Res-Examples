##############
# Create Caterpillar plot with ggplot2
# Christopher Gandrud
# 7 January 2013
##############

# Load Zelig package
library(Zelig)

# Estimate model
NBModel2 <- zelig(Examination ~ Education + Agriculture + Catholic +
                    Infant.Mortality, 
                  model = "normal.bayes",
                  data = swiss, cite = FALSE)

# Create summary object
NBModel2Sum <- summary(NBModel2)

# Create summary data frame
NBSum2DF <- data.frame(NBModel2Sum$summary)

# Convert row.names to normal variable
NBSum2DF$Coef <- row.names(NBSum2DF)

# Remove the SD variable
NBSum2DF <- NBSum2DF[, c("Coef", "Mean", "X2.5.", "X97.5.")]

# Keep only coefficient estimates
## This allows for a more interpretable scale
NBSum2DF <- subset(NBSum2DF, Coef != "(Intercept)")
NBSum2DF <- subset(NBSum2DF, Coef != "sigma2")

CatPlot <- ggplot(data = NBSum2DF, aes(x = reorder(Coef, X2.5.),
                                        y = Mean,
                                        ymin = X2.5., ymax = X97.5.)) +
                    geom_pointrange(size = 1.4) +
                    geom_hline(aes(intercept= 0), linetype = "dotted") +
                    xlab("Variable\n") + ylab("\nCoefficient Estimate") +
                    coord_flip() +
                    theme_bw(base_size = 20)

# Print plot
print(CatPlot)