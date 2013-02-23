################
# Example Slidify Slideshow Creation File
# Christopher Gandrud
# 24 February 2013
################

## Please note that this code is slightly different than that in the book.

# Set working directory
setwd("/git_repositories/Rep-Res-Examples/RMarkdownExamples/ExampleSlidify/")

# Load slidify
library(slidify)

# Create slide show
author("MySlideShow")

### When the author command creates the new index.html file, copy the following code into it.

---
title       : Example slidify and knitr Slideshow
subtitle    : 
author      : Christopher Gandrud
job         : 
framework   : io2012        
highlighter : highlight.js  
hitheme     : tomorrow       
widgets     : []            
mode        : selfcontained 
--- 
  
## Access the Code
  
The code to create the following figure is available online.

To access it we can type: 
  
```{r, eval=FALSE}
# Access and run the code to create a caterpillar plot
devtools::source_url("http://bit.ly/VRKphr")
```

---
  
## The Figure
  
```{r, echo=FALSE, message=FALSE}
# Access and run the code to create a caterpillar plot
devtools::source_url("http://bit.ly/VRKphr")
```