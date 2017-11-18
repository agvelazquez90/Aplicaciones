ts.title <- function(title){
  if(title == 'NULL'){
    ts.title = "" 
    return(ts.title)
  }
  else{
    ts.title = paste(title)
    return(ts.title)
  }

}
