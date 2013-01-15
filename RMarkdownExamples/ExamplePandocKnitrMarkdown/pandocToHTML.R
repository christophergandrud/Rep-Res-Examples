############
# pandocToHTML function for rendering Markdown documents with Pandoc in R
#  uses bibliographies
# Christopher Gandrud
# 15 January 2013
############


#### Function for rendering MD to HTML with Pandoc
pandocToHTML <-  
  function(inputFile, outputFile) 
  {      
    system(paste("pandoc", shQuote(inputFile), "-o", shQuote(outputFile), "--bibliography PandocBib.bib --css Markdown.css"))
  }


#### Example ####
# Set working directory to where your .Rmd file is located
# setwd()

# Knit R Markdown file to .md
# knitr::knit("PandocKnitrMarkdown.Rmd", "PandocKnitrMarkdown.md")

# Render .md in .html with Pandoc
# pandocToHTML("PandocKnitrMarkdown.md", "PandocKnitrMarkdown.html")