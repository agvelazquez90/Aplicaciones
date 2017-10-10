library(shiny)
library(plotly)
library(data.table)

df <- fread("https://indicadores.pr/dataset/702d4192-a9f9-483e-b003-05e2c387bd6e/resource/ab758709-173d-41dd-a649-5b68db8921f6/download/pmi_201708.csv")
df[,1] = as.Date(df[[1]])
colnames(df)= c("Fecha","PMI","General", "New Orders", "Production", "Employment", 
                "Supplier Deliveries", "Own Inventories", "Customers Inventories", 
                "Prices Paid", "Backlog", "Export Orders")

server = function(input, output) {

observe({
df.ts = melt(df, id="Fecha")
values=subset(df.ts, df.ts$variable == input$entry)
ts = data.frame(Date=values[,1],value=values[,3])
m = list(l = 30,r = 40,b = 20,t = 20, pad = 0)
std=50

output$index <- renderPlotly({
    plot_ly(ts, x= ~Fecha) %>%
      add_lines(y=std,line = list(color = "#9bc337", width = 3), name = "Standard Measurement",hoverinfo = "text", text = "") %>%
      add_lines(y=ts$value,line = list(color = "#8771c2", width = 2), name = input$entry) %>% 
      layout(autosize = T, 
             margin = m,
             legend = list(orientation = 'h', font = list(size = 10)), 
             yaxis = list(domain = c(min(ts$value),
                                     max(ts$value)),
                          side = "right",
                          title = "",
                          gridwidth = 2),
             xaxis = list(showgrid = F, 
                          ticklen = 10, 
                          nticks = 10,
                          ticks = "outside",
                          tickmode = "array",
                          #tickvals = seq(as.Date("2010-01-01"), Sys.Date(), by = "month"),
                          tickangle = 0,
                          title = ""))
  })
})
}