source("x_y.R")

processing_lat.lot <- function(d, test){
  
# Extraer la informacion de GIS
  d1 = d
  colnames(d1) = c("X", "Y")
  coordinates(d1) <- c("X", "Y")
  proj4string(d1) <- CRS("+init=epsg:32161") 
  CRS.original <- CRS("+init=epsg:32161")
  d.wgs84 <- spTransform(d1, CRS.original)
  BG<-readOGR(dsn=".",layer="BG2010")
  proj4string(BG)<-CRS.original
  join2 <- (over(d.wgs84, BG[,c("TRACTCE10", "NAMELSAD10","GEOID10" )]))

#convertir lat,lon a xy  
  coordinates(d) <- c("X", "Y")
  proj4string(d) <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs ++towgs84=0,0,0")
  CRS.new <- CRS("+init=epsg:32161") #nad83
  d.nad83 <- spTransform(d, CRS.new)
  table<-cbind(test$ID, as.data.frame(d.nad83), test$Lon, test$Lat, as.data.frame(join2))
  colnames(table) = c("ID","X","Y","Longitud","Latitud","Tract Census", "Block Group", "Geo ID")
  
  return(table)
  
}