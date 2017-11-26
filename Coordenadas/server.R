source("convert.R")
library(shiny)
library(rgdal)

shinyServer(function(input,output) {
  getData<-reactive({
    inFile <- input$file1
      if (is.null(inFile)){
        return(NULL)
      }
    df <- read.csv(inFile$datapath)
    table = convert(df)
    
  })
  
  output$contents <- renderTable(digits=6,getData()) 
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("Data", ".csv", sep = "")
    },
    content = function(file) {
      write.table(getData(), file, row.names = FALSE)
    }
  )
})

