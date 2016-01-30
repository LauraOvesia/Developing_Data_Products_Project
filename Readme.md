# Coursera Developing Data Products Project Documentation

---

To run the application, please visit the following URL to access the app:
(https://laurao.shinyapps.io/developing_data_productsProject/)

The sidebar on the left has 7 important input options that will allow the user to enter the data necessary to calculate the risk of having a heart attack in the next 10 years. 

Manipulating any of the options listed above will recalculate the prediction.

The prediction algorithm uses information from the Framingham Heart Study to predict a person's chance of developing cardiovascular disease in the next 10 years.
More data about the Framingham Heart Study is available  here - https://en.wikipedia.org/wiki/Framingham_Risk_Score

For this app we will use just a subset from the Framingham database, using just the most important columns that can influence the prediction results.

The substructure of the modified database is:

```{r echo=FALSE}
framingham <- read.csv("framingham.csv")

newFramingham<- data.frame(age=framingham$age,male=framingham$male,totChol=framingham$totChol,currentSmoker=framingham$currentSmoker,diabetes=framingham$diabetes,sysBP=framingham$sysBP,BPMeds=framingham$BPMeds,TenYearCHD=framingham$TenYearCHD)

str(newFramingham)
```

