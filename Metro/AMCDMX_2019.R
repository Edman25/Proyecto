#Instalación de paqueterías
#install.packages("geosphere", dependencies = TRUE)
#install.packages("jsonlite", dependencies = TRUE)
#install.packages("rjson", dependencies = TRUE)
#install.packages("pollution")
#install.packages("reshape2")

#Vamos a definir la carpeta de trabajo
setwd("/home/edman/Documents/Progra/Proyecto_wd")
#graphs <- ("/home/edman/Documents/Progra/Proyecto_wd/grap")
#Cargamos paqueterías
library("dplyr")
library("ggplot2")
library("reshape2")

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

####Graficando un png para cada linea

#for (i in lineas) {
 #   temp_plot = ggplot(data= subset(afluencia_2018_linea, Linea == i)) + 
  #  geom_point(size=3, aes(x=Mes, y=afluencia_promedio_mensual )) +
   # ggtitle(i)
    #ggsave(temp_plot, file=paste0("plot_", i,".png"), width = 14, height = 10, units = "cm")
#}

pdf("lines.pdf")
for (i in unique(afluencia_2018_linea$Mes)){
     temp_line <- filter(afluencia_2018_linea, Mes == i)
     print(ggplot(temp_line, aes(x=Linea, y=afluencia_promedio_mensual ))+geom_point()+
     ggtitle(i))
}
dev.off()

####GRáfico 2018 con varias líneas
labels <- c("enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre")

ggplot(afluencia_2018_linea, aes(x = factor(Mes, level = labels), y = afluencia_promedio_mensual, color = Linea)) + 
  geom_line() +
  geom_point()
  


####

