library(shiny)
shinyUI(fluidPage(theme = "style.css",
  titlePanel("Consult Census Geography by Location"),
  
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "Choose CSV File",
                           accept = c(
                             "text/csv",
                             "text/comma-separated-values,text/plain",
                             ".csv")
    ),
      tags$hr(),
      downloadLink("downloadData", "Download Data")
    ),
    mainPanel(
      #htmlOutput("texto"),
      #img(src='globo.jpeg'),
      tableOutput("contents"))
  )
  
))
        