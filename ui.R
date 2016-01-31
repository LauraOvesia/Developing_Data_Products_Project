library(shiny)
shinyUI(fluidPage(
  titlePanel(title=h2("Risk Assessment Tool for Estimating Your 10 years Risk of Having a Heart Attack.", align="center")),
 
   sidebarLayout(
    sidebarPanel(("Enter your personal information to calculate the prediction"),
                 
                 textInput("name", "Enter your full name", ""),
                 sliderInput("sliderage", "How old are you?", min=30, max=100, value=40),
                 radioButtons("gender", "What is your gender?", list("Male", "Female"), "Male"),
                 textInput("cholesterol", "Total cholesterol in mmol/L: (between 100 and 600)", "0"),
                 radioButtons("smok", "Are you a smoker?", list("yes", "no"), "no" ),
                 radioButtons("diabetes", "Do you have diabetes?", list("yes","no"), "no"),
                 textInput("sbp", "Systolic blood pressure, mm/Hg: (between 80 and 250)","0" ),
                 radioButtons("medication", "Are you currently on any medication to treat high blood pressure?", list("yes","no"), "no")
                 #submitButton("update!"),
                 #p("Press the button to update your information!")
                 
                 ),
   
     mainPanel(
       tabsetPanel(type="tab",
                   tabPanel("Calculate prediction and results", h2("Personal information"),
                            textOutput("myname"),
                            textOutput("mysliderage"), 
                            textOutput("mygender"),
                            textOutput("mycholesterol"),
                            textOutput("mysmok"),
                            textOutput("mydiabetes"),
                            textOutput("mysbp"),
                            textOutput("mymedication"),
                            h2("Prediction"),
                            textOutput("myPrediction"),
                            plotOutput('plot')),
                   tabPanel("Instructions", fluidPage(htmlOutput('instructions'))),
                   
                   tabPanel("Prediction Database Head", tableOutput("data")),
                   tabPanel("Prediction Database Structure", verbatimTextOutput("structure"))
                  
                  
         
         
       )
  
               )
        
    
  )
  
  ))