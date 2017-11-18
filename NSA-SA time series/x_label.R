label_in_x <- function(x_label){
  if(x_label == 'NULL'){
    ax  = list(showgrid = F, 
               ticklen = 2, 
               nticks = 10,
               ticks = "outside",
               tickmode = "array",
               tickvals = "",
               tickangle = 0,
               title = "Date",
               tickwidth = 2)
              
    return(ax)
    }
  else{
    ax  = list(showgrid = F, 
               showline = F,
               ticklen = 2, 
               nticks = 10,
               #ticks = "outside",
               tickmode = "array",
               tickvals = "",
               tickangle = 0,
               title = paste(x_label),
               tickwidth = 2)
    }        
   return(ax)
}
