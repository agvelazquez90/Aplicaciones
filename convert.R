source("x_y.R")
source("lat_lon.R")

convert <- function(test){
  if(is.null(test$X)){
    location = c("Lon", "Lat")
    d = test[, location]
    colnames(d) = c("X", "Y")
    table = processing_lat.lot(d, test)
    return(table)
  }
  else{
    location = c("X", "Y")
    d = test[, location]
    colnames(d) = c("Lon", "Lat")
    table = processing_xy(d, test)
    return(table)
  }
}