#Instalación de paqueterías
#install.packages("geosphere", dependencies = TRUE)
#install.packages("jsonlite", dependencies = TRUE)
#install.packages("rjson", dependencies = TRUE)
install.packages("pollution")

#Vamos a definir la carpeta de trabajo
#setwd("/Users/adminyair/Desktop/Uber data")

#Cargamos paqueterías
library("dplyr")
library("ggplot2")

#Renombramos la el nombre del dataset (para poder manipularlo mejor)
afluencia <- afluencia.diaria.del.metro.cdmx

#Mostramos info (sólo las primeras 6 líneas)
head(afluencia)

#Filtramos (Sólo la que estamos buscando)
afluencia_2019 <- filter(afluencia, Año == 2019) %>% 
                  group_by(Linea, Estacion, Mes, Dia) %>%
                  summarise(Afluencia) %>%
                  
                  


            