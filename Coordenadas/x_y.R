processing_xy <- function(d, test){
  
  coordinates(d) <- c("Lon", "Lat")
  proj4string(d) <- CRS("+init=epsg:32161") # NAD83 PR& V. IS
  CRS.new <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs ++towgs84=0,0,0") #WGS84
  d.wgs84 <- spTransform(d, CRS.new)
  #CT<-readOGR(dsn=".",layer="CT2010")
  BG<-readOGR(dsn=".",layer="BG2010")
  #proj4string(CT)<-CRS.new
  proj4string(BG)<-CRS.new
  #join1 <- over(d.wgs84, CT[,c("COUNTYFP10","NAME10")])
  join2 <- (over(d.wgs84, BG[,c("TRACTCE10", "NAMELSAD10","GEOID10" )]))
  
  
  #tract <- readOGR(dsn=".", layer = "cb_2014_36_tract_500k")
  #tract@data$GEOID<-as.character(tract@data$GEOID)
  #print(tract)
  
  
  table<-cbind(test$ID,test$X, test$Y, as.data.frame(d.wgs84), as.data.frame(join2))
  colnames(table) = c("ID","X","Y","Longitud","Latitud","Tract Census", "Block Group", "Geo ID")
  
  return(table)
}
