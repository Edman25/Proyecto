####Definiendo directorio de trabajo e instanciando librerías
setwd("/home/edman/Documents/Progra/Proyecto_wd")
library(jsonlite)
library(geosphere)
library(dplyr)
library(leaflet)
#####Obteniendo puntos únicos de las zonas de movimiento de Uber desde el archivo GeoJson
# load objects
zonas_cdmx <-jsonlite::fromJSON("mexico_city_agebs.json")
# check your region list
head(zonas_cdmx$features$properties)
# polygon coordinates for each region
str(zonas_cdmx$features$geometry$coordinates)
##Generando centroide de prueba para region 1 
cdmx_polygons = zonas_cdmx$features$geometry$coordinates
#my_temp_poly <- cdmx_polygons[[1]]
my_temp_poly <- cdmx_polygons[[4]][[1]]
poly_len <-length(my_temp_poly)/2
#poly_df <- data.frame(lng=my_temp_poly[1,1:poly_len,1], lat=my_temp_poly[1,1:poly_len,2])
poly_df <- data.frame(lng=my_temp_poly[1:poly_len,1], lat=my_temp_poly[1:poly_len,2])
my_poly_matrix<- data.matrix(poly_df)
temp_centroid<-centroid(my_poly_matrix)
####Visualizando centroides
leaflet(temp_centroid) %>% 
  addTiles() %>% 
  addMarkers() %>% 
  addPolygons(lng= poly_df$lng, lat=poly_df$lat)

