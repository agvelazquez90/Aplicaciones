library(shiny)
library(data.table)
library(plotly)

source("plotly.R")

server = function(input, output, session) {
  
  observe({
    query <- parseQueryString(session$clientData$url_search)
    if (!is.null(query[['x']])) {
      df=fread(query$url)
      ord = c(query['x'],query['NSA'], query['SA'])
      df.par = NULL
      df.par = c((paste(ord[1])), paste(ord[2]), paste(ord[3]))
      df.par = df[, df.par, with=FALSE]
      
      ads = c(query['x_label'],query['y_label'],query['title'], query['line'])
      
      output$plot <- renderPlotly({
         p <- graph.plotly(df.par, ads[1], ads[2], ads[3])
          p 
          })
    }
    else{
    t=seq(1,20)
    date = seq(as.Date("2000-01-01"),by="month", length.out = length(t))
    ts=data.frame(x=date,y=t)
    print(ts)
    output$plot <- renderPlotly({
    g=ggplot(ts, aes(x,y))+geom_line()
    ggplotly(g)
  })
    }
  })
}