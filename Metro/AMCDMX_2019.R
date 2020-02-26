#Instalación de paqueterías
#install.packages("geosphere", dependencies = TRUE)
#install.packages("jsonlite", dependencies = TRUE)
#install.packages("rjson", dependencies = TRUE)
#install.packages("pollution")

#Vamos a definir la carpeta de trabajo
setwd("/home/edman/Documents/Progra/Proyecto_wd")

#Cargamos paqueterías
library("dplyr")
library("ggplot2")

#Renombramos la el nombre del dataset (para poder manipularlo mejor)
afluencia <- read.csv("afluencia-diaria-del-metro-cdmx.csv", header = TRUE)

#Mostramos info (sólo las primeras 6 líneas)
head(afluencia)

#afluencia mensual por estación 2019
afluencia_2018_estacion <- filter(afluencia, Año == 2018) %>% 
                           group_by(Linea, Estacion, Mes) %>%
                           summarise(afluencia_mensual_total = sum(Afluencia), afluencia_promedio_mensual = mean(Afluencia))
#Afluencia mensual por línea
afluencia_2018_linea <- filter(afluencia, Año == 2018) %>% 
                        group_by(Linea, Mes) %>%
                        summarise(afluencia_mensual_total = sum(Afluencia), afluencia_promedio_mensual = mean(Afluencia))

#Graficando afluencia promedio de las líneas
linea1_2018 <- afluencia_2018_linea %>% filter(Linea == "Linea 1") %>%
                                        select(Linea, Mes, afluencia_promedio_mensual)
ggplot(linea1_2018, aes("Mes", "Afluencia_promedio_mensual"))
       
          

                  


            