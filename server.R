#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # get the selected input$column from ui.R for further use
    column <- input$column
    
    # generate bins based on input$bins from ui.R
    x    <- mtcars[,column]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins and modify the Title of the histogram according to the selection
    hist(x, breaks = bins, col = 'darkgray', border = 'white', main = paste("Histogram of ", column))
    
  })
  
})
