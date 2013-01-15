
#### Function for rendering MD to HTML with Pandoc
pandocToHTML <-  function(inputFile, outputFile) 
{      
  system(paste("pandoc", shQuote(inputFile), "-o", shQuote(outputFile), "--bibliography PandocBib.bib --smart"))
}

setwd("/git_repositories/Rep-Res-Examples/RMarkdownExamples/ExamplePandocKnitrMarkdown/")

knitr::knit("PandocKnitrMarkdown.Rmd", "PandocKnitrMarkdown.md")

pandocToHTML("PandocKnitrMarkdown.md", "PandocKnitrMarkdown.html")