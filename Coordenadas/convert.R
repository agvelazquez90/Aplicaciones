source("x_y.R")
source("lat_lon.R")

convert <- function(df){
  col_name = toupper(names(df))
  names(df) <- col_name
  if(is.null(df$X)){
    location = c("LON", "LAT")
    d = df[, location]
    colnames(d) = c("X", "Y")
    table = processing_lat.lot(d, df)
    return(table)
  }
  else{
    location = c("X", "Y")
    d = df[, location]
    colnames(d) = c("LON", "LAT")
    table = processing_xy(d, df)
    return(table)
  }
}
