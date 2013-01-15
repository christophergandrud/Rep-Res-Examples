# Example Pandoc + knitr Markdown Document
## Christopher Gandrud
### 14 January 2013

-----

This is some text.^[This is an inline footnote.]

This is a *knitr* code chunk:


```r
plot(cars$speed, cars$dist)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 


This is a citation [see @Donohue2009, 10]. [-@Donohue2009]
