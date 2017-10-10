library(shiny)
library(plotly)

colnames= c("PMI","General", "New Orders", "Production", "Employment", 
                "Supplier Deliveries", "Own Inventories", "Customers Inventories", 
                "Prices Paid", "Backlog", "Export Orders")

shinyUI(fluidPage(
selectInput(inputId = "entry",
            label = "",
            choices = colnames),
#downloadLink("downloadData", "Download Dataset"),

plotlyOutput("index")
))
