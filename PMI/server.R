library(shiny)
library(data.table)
library(rCharts)

df <- fread("https://indicadores.pr/dataset/702d4192-a9f9-483e-b003-05e2c387bd6e/resource/ab758709-173d-41dd-a649-5b68db8921f6/download/pmi_201708.csv")
#df[,1] = as.Date(df[[1]])
colnames(df)= c("Fecha","PMI","General", "New Orders", "Production", "Employment", 
                "Supplier Deliveries", "Own Inventories", "Customers Inventories", 
                "Prices Paid", "Backlog", "Export Orders")

require(rCharts)
server = function(input, output) {

observe({
df.ts = melt(df, id="Fecha")
values=subset(df.ts, df.ts$variable == input$entry)
ts = data.frame(Date=values[,1],value= values[,3], name = rep(input$entry ,dim(values)[1]))
treshold = data.frame(Date = values[,1],value = rep(50,dim(values)[1]), name = rep("Threshold",dim(values)[1]))
df <- rbind(ts,treshold)

output$index <- renderChart2({
  ts <- hPlot(x = "Fecha", y = "value", data = df, type = "line", group = "name")
  ts$set(width = '100%', height = "100%")
  return(ts)
})
})
}