import numpy as np
import pandas as pd
pd.set_option('display.max_columns', 500)
import vaex as vx

####Leyendo archivos de 2018 y 2019

#uber_2018_q1 = pd.read_csv("Proyecto_wd/Uber_monthly/mexico_city-agebs-2018-1-All-MonthlyAggregate.csv")
#uber_2018_q2 = pd.read_csv("Proyecto_wd/Uber_monthly/mexico_city-agebs-2018-2-All-MonthlyAggregate.csv")
#uber_2018_q3 = pd.read_csv("Proyecto_wd/Uber_monthly/mexico_city-agebs-2018-3-All-MonthlyAggregate.csv")
#uber_2018_q4 = pd.read_csv("Proyecto_wd/Uber_monthly/mexico_city-agebs-2018-4-All-MonthlyAggregate.csv")
uber_2019_q1 = pd.read_csv("Proyecto_wd/Uber_monthly/mexico_city-agebs-2019-1-All-MonthlyAggregate.csv")
uber_2019_q2 = pd.read_csv("Proyecto_wd/Uber_monthly/mexico_city-agebs-2019-2-All-MonthlyAggregate.csv")
uber_2019_q3 = pd.read_csv("Proyecto_wd/Uber_monthly/mexico_city-agebs-2019-3-All-MonthlyAggregate.csv")

###Haciendo merge de archivos del 2018 y 2019
#uber_2018 = uber_2018_q1.append(uber_2018_q2, ignore_index = True) 
#uber_2018 = uber_2018.append(uber_2018_q3, ignore_index = True) 
#uber_2018 = uber_2018.append(uber_2018_q4, ignore_index = True) 
uber_2019 = uber_2019_q1.append(uber_2019_q2, ignore_index = True) 
uber_2019 = uber_2019.append(uber_2019_q3, ignore_index = True) 

###Generando data frames en Vaex
#vaex_df = vx.from_pandas(uber_2018, copy_index=False)
vaex_df_2 = vx.from_pandas(uber_2019, copy_index=False)

###Convirtiendo a HDF5
#vaex_df.export_hdf5(path="uber_2018.hdf5", progress=False)
vaex_df_2.export_hdf5(path="uber_2019.hdf5", progress=False)