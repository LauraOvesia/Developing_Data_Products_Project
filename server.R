library(shiny)
library(caTools)
library(ROCR)
shinyServer(function(input,output){
  
  inValues <- reactive({
    
    # Compose data frame
    data.frame(
      age =as.integer(c(input$sliderage)), 
      male = as.integer(c(if (input$gender=="Male") 1 else 0)), 
      totChol=as.integer(c(input$cholesterol)),
      currentSmoker= as.integer(c(if (input$smok=="Yes") 1 else 0)),
      diabetes=as.integer(c(if (input$diabetes=="Yes") 1 else 0)),
      sysBP=as.numeric(c(input$sbp)),
      BPMeds=as.integer(c(if (input$medication=="Yes") 1 else 0)),
      TenYearCHD=as.integer(0)
     )
  })
  
 
  framingham <- read.csv("framingham.csv")
  newFramingham<- data.frame(age=framingham$age,male=framingham$male,totChol=framingham$totChol,currentSmoker=framingham$currentSmoker,diabetes=framingham$diabetes,sysBP=framingham$sysBP,BPMeds=framingham$BPMeds,TenYearCHD=framingham$TenYearCHD)
  # Logistic Regression Model
  framinghamLog = glm(TenYearCHD ~ ., data = newFramingham, family=binomial)
  
  
  output$myPrediction <- renderText({
    predictTest = predict(framinghamLog, type="response", newdata=inValues())
    paste("Prediction:", as.numeric(predictTest))
    })
  
  
  
    output$myname <- renderText({paste("My full name is:",input$name)})
    output$mysliderage <- renderText({paste("Age:",input$sliderage)})
    output$mygender <- renderText({paste("Gender:",input$gender)})
    output$mycholesterol <- renderText({paste("Total cholesterol:",input$cholesterol)})
    output$mysmok <- renderText({paste("Smoker:",input$smok)})
    output$mydiabetes <- renderText({paste("Diabetes:", input$diabetes)})
    output$mysbp <- renderText({paste("Sistolic blood presure:", input$sbp)})
    output$mymedication <- renderText({paste("Medication for HBP:", input$medication)})
   
    output$plot <- renderPlot({
      predictTest = predict(framinghamLog, type="response", newdata=inValues())
      numericPredictText= as.numeric(predictTest)
      slices <- c(numericPredictText, 1-numericPredictText)
      lbls <- c("True", "False")
      
      
      pct <- round(slices/sum(slices)*100)
      lbls <- paste(lbls, pct) # add percents to labels 
      lbls <- paste(lbls,"%",sep="") # ad % to labels 
      pie(slices,labels = lbls, col=rainbow(length(lbls)),
          main="Probability to have a heart atack")
      })
      
    output$data <-renderTable({
      head(newFramingham)
      })
    output$structure <- renderPrint({
     
      str(newFramingham)
    })
    output$instructions <- renderText({  
      readLines("Readme.html")  
    })
  
   
}

)