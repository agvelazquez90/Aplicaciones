processing_xy <- function(d, df){
  
  coordinates(d) <- c("LON", "LAT")
  proj4string(d) <- CRS("+init=epsg:32161") # NAD83 PR& V. IS
  CRS.new <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs ++towgs84=0,0,0") #WGS84
  d.wgs84 <- spTransform(d, CRS.new)
  BG<-readOGR(dsn=".",layer="BG2010")
  proj4string(BG)<-CRS.new
  join2 <- (over(d.wgs84, BG[,c("TRACTCE10", "NAMELSAD10","GEOID10" )]))
  
  table<-cbind(df$ID,df$X, df$Y, as.data.frame(d.wgs84), as.data.frame(join2))
  colnames(table) = c("ID","X","Y","Longitud","Latitud","Tract Census", "Block Group", "Geo ID")
  
  return(table)
}
