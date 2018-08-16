#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
# get the mt cars data to bind to the select input
data(mtcars)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Motor Trend Car Road Tests"),
  
  # Sidebar 
  sidebarLayout(
    sidebarPanel(
       # a select input / dropdown to select the column for visualisation of the histogram of that variable
       # bind the columns names to the select input
       selectInput(inputId = "column", label ="Select variable", choices=colnames(mtcars), selected= colnames(mtcars), multiple= FALSE),
       # a slider input for number of bins 
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30)
    ),
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
