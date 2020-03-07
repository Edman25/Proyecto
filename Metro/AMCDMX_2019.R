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

afluencia_años <- afluencia %>% group_by(Linea, Mes, Año) %>%
                  summarise(afluencia_mensual_total = sum(Afluencia), afluencia_promedio_mensual = mean(Afluencia))


#pdf("lines.pdf")
#for (i in unique(afluencia_2018_linea$Mes)){
#     temp_line <- filter(afluencia_2018_linea, Mes == i)
#     print(ggplot(temp_line, aes(x=Linea, y=afluencia_promedio_mensual ))+geom_point()+
#     ggtitle(i))
#}
#dev.off()





####GRáfico 2018 con varias líneas
Meses <- c("enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre")
lineas_metro <- c("Linea 1", "Linea 2", "Linea 3", "Linea 4", "Linea 5", "Linea 6", "Linea 7", "Linea 8", "Linea 9", "Linea A", "Linea B", "Linea 12")
Año <- c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019")

pdf("lines.pdf")
for (i in unique(afluencia_años$Año)){
  temp_year <- filter(afluencia_años, Año == i)
  print(ggplot(temp_year, aes(x = factor(Mes, level = Meses), y = afluencia_promedio_mensual, color = factor(Linea, level = lineas_metro)))+ 
  geom_line()+
  geom_point()+
  ggtitle(i))
}
dev.off()

####Graficando un png para cada linea

for (i in unique(afluencia_años$Año)) {
    temp_plot = ggplot(data= subset(afluencia_años, Año == i)) + 
    geom_point(size=3, aes(x = factor(Mes, level = Meses), y = afluencia_promedio_mensual, color = factor(Linea, level = lineas_metro))) +
    ggtitle(i)+
    theme(axis.text.x = element_text(angle=65, vjust=0.6))
    ggsave(temp_plot, file=paste0("plot_", i,".png"), width = 14, height = 10, units = "cm")
}

 


