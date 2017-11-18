source("title.R")
source("y_label.R")
source("x_label.R")

graph.plotly <- function(df.par, x, y, title){
df = data.frame(Date = df.par[[1]], NSA = df.par[[2]], SA = df.par[[3]])

#eje de y1
ay = label_in_y(y)

#eje de y2
ay2 = list(title = "",
           overlaying = "y",
           side = "right")

#eje de x
ax = label_in_x(x)

# margenes
m = list(l = 10,r = 80,b = 150,t = 20, pad = 6)

# Legend
l = list(orientation = 'h', font = list(size = 10))

#linea
ts.line.NSA = list(color = "#D7D7D7", width = 2)
ts.line.SA = list(color = "#050505", width = 2)

# titulo
t = ts.title(title)

if(y == 'NULL'){
  name = "Serie de Tiempo"
}
else{
  name = y
}

p <- plot_ly(data = df, x = df[,1]) %>%
  add_lines(y = df[[2]], yaxis = "y2", line = ts.line.NSA, name = "Con estacionalidad") %>%    
  add_lines(y = df[[3]], yaxis = "y2", line = ts.line.SA, name = "Desestacionalizado")%>%
     layout(
          title = t,
          legend = l,
          margin = m,
          yaxis = ay,
          yaxis2 = ay2,
          xaxis = ax)
  return(p)
}


