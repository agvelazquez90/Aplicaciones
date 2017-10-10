source("convert.R")
#source("package.R")

#packages <- c("shiny", "rgdal")
#ipak(packages)

library(shiny)
library(rgdal)

shinyServer(function(input,output) {
  getData<-reactive({
    inFile <- input$file1
      if (is.null(inFile)){
        return(NULL)
      }
    test<-read.csv(inFile$datapath)
    table = convert(test)
    
  })
  
  output$texto<-renderPrint({
      str1 <- ("<h3>fila 1</h3>")
      tr2 <- ("<h3>fila 2</h3>")
      str3 <- ("<h3>fila 3</h3>")
      str4 <- ("<h3>fila 4</h3>")
      str5 <- ("<h3>fila 5</h3>")
      HTML(paste(str1, str2,str3,str4,str5, sep = '<br/>'))
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

