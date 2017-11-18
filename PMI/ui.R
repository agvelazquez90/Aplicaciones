library(shiny)
library(rCharts)

colnames= c("PMI","General", "New Orders", "Production", "Employment", 
                "Supplier Deliveries", "Own Inventories", "Customers Inventories", 
                "Prices Paid", "Backlog", "Export Orders")

require(rCharts)
shinyUI(fluidPage(
  #tags$head(
   # tags$link(rel = "stylesheet", type = "text/css", href = "pmi_child.css")),
selectInput(inputId = "entry",
            label = "",
            choices = colnames),
#downloadLink("downloadData", "Download Dataset"),

showOutput("index", "highcharts")
))
