import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

########### Datos Perdidos
datos = pd.read_csv("Data.csv")

# Seleccionar las características independientes (x) y la variable objetivo (y)
x = datos.iloc[:, :-1].values  # Selecciona todas las columnas excepto la última como características independientes
y = datos.iloc[:, -1].values   # Selecciona la última columna como la variable objetivo



