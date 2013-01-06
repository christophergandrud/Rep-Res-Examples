###############
# Create a simple scatter plot of cars speed and stopping distances
# Christopher Gandrud
# 6 January 2012
###############

plot(x = cars$speed, y = cars$dist,
     xlab = "Speed (mph)",
     ylab = "Stopping Distance (ft)",
     cex.lab = 2)