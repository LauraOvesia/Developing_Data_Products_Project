---
title       : Risk Assessment Tool for Estimating Your Ten Years Risk of Having a Heart Attack
subtitle    : January 30 2016
author      : Laura Ovesia
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---


## Summary
The app will calculate the risk of heart attack for the next ten years, using a backend database and prediction algorithms. 

The prediction algorithm uses information from the Framingham Heart Study to predict a person's chance of developing cardiovascular disease in the next 10 years.

More data about the Framingham Heart Study is available here:

https://en.wikipedia.org/wiki/Framingham_Risk_Score

The prediction algorithm is using GLM on a subset of the original database.
The used structure is presented in the next slide.



---
## Prediction Database Structure


```r
framingham <- read.csv("framingham.csv")
newFramingham<- data.frame(age=framingham$age,male=framingham$male,
                    totChol=framingham$totChol,currentSmoker=framingham$currentSmoker,
                    diabetes=framingham$diabetes,sysBP=framingham$sysBP,
                    BPMeds=framingham$BPMeds,TenYearCHD=framingham$TenYearCHD)
str(newFramingham)
```

```
## 'data.frame':	4240 obs. of  8 variables:
##  $ age          : int  39 46 48 61 46 43 63 45 52 43 ...
##  $ male         : int  1 0 1 0 0 0 0 0 1 1 ...
##  $ totChol      : int  195 250 245 225 285 228 205 313 260 225 ...
##  $ currentSmoker: int  0 0 1 1 1 0 0 1 0 1 ...
##  $ diabetes     : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ sysBP        : num  106 121 128 150 130 ...
##  $ BPMeds       : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ TenYearCHD   : int  0 0 0 1 0 0 1 0 0 0 ...
```

---
## Application 
https://laurao.shinyapps.io/developing_data_productsProject/

<div style='text-align: center;'>
    <img height='460' src='Image1.PNG' />
</div>

---
## Why use this app?

1. Calculate your heart attack risk for the next ten years.

2. Determine witch factors contribute the most in the risk.

3. Spark your interest in your personal health.

View the app on: https://laurao.shinyapps.io/developing_data_productsProject/

Documentation and Code: https://github.com/LauraOvesia/Developing_Data_Products_Project


