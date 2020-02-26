####Definiendo wd y librerías a utilizar
setwd("/home/edman/Documents/Progra/Proyecto_wd/Uber_monthly")

####Bases de tiempo promedio por mes (leyendo)  
#uber_month_2016Q1 <- read.csv("mexico_city-agebs-2016-1-All-MonthlyAggregate.csv", header = TRUE)
#uber_month_2016Q2 <- read.csv("mexico_city-agebs-2016-2-All-MonthlyAggregate.csv", header = TRUE)
#uber_month_2016Q3 <- read.csv("mexico_city-agebs-2016-3-All-MonthlyAggregate.csv", header = TRUE)
#uber_month_2016Q4 <- read.csv("mexico_city-agebs-2016-4-All-MonthlyAggregate.csv", header = TRUE)
uber_month_2017Q1 <- read.csv("mexico_city-agebs-2017-1-All-MonthlyAggregate.csv", header = TRUE)
uber_month_2017Q2 <- read.csv("mexico_city-agebs-2017-2-All-MonthlyAggregate.csv", header = TRUE)
uber_month_2017Q3 <- read.csv("mexico_city-agebs-2017-3-All-MonthlyAggregate.csv", header = TRUE)
uber_month_2017Q4 <- read.csv("mexico_city-agebs-2017-4-All-MonthlyAggregate.csv", header = TRUE)
uber_month_2018Q1 <- read.csv("mexico_city-agebs-2018-1-All-MonthlyAggregate.csv", header = TRUE)
uber_month_2018Q2 <- read.csv("mexico_city-agebs-2018-2-All-MonthlyAggregate.csv", header = TRUE)
uber_month_2018Q3 <- read.csv("mexico_city-agebs-2018-3-All-MonthlyAggregate.csv", header = TRUE)
uber_month_2018Q4 <- read.csv("mexico_city-agebs-2018-4-All-MonthlyAggregate.csv", header = TRUE)
uber_month_2019Q1 <- read.csv("mexico_city-agebs-2019-1-All-MonthlyAggregate.csv", header = TRUE)
uber_month_2019Q2 <- read.csv("mexico_city-agebs-2019-2-All-MonthlyAggregate.csv", header = TRUE)
uber_month_2019Q3 <- read.csv("mexico_city-agebs-2019-3-All-MonthlyAggregate.csv", header = TRUE)
####Bases (joining)
uber_month_2017_2019q3 <- rbind(uber_month_2017Q1, uber_month_2017Q2, uber_month_2017Q3, uber_month_2017Q4, 
                                uber_month_2018Q1, uber_month_2018Q2, uber_month_2018Q3, uber_month_2018Q4
                                uber_month_2019Q1, uber_month_2019Q2, uber_month_2019Q3)