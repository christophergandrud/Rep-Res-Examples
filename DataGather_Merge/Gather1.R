################
# Download CSV file from Dropbox
# Christopher Gandrud
# Updated 28 December 2012
# Data from "The diffusion of financial supervisory governance ideas"
# (Gandrud 2012)
################

FinRegulator <- read.table("http://bit.ly/PhjaPM",
                    		sep = ",", header = TRUE)
