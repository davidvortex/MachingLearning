# Importar librerías necesarias
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression

# Leer datos desde un archivo CSV
dataset = pd.read_csv('Salario_Data.csv')

# Dividir los datos en características independientes (X) y variable dependiente (Y)
x = dataset.iloc[:, :-1].values  # Todas las columnas excepto la última
y = dataset.iloc[:, -1].values   # Solo la última columna

# Dividir los datos en conjuntos de entrenamiento y prueba
x_Capacitar, x_Prueba, y_Capacitar, y_Prueba = train_test_split(
    x, y, test_size=1/3, random_state=0
)

# Crear y entrenar el modelo de regresión lineal
regresar = LinearRegression()
regresar.fit(x_Capacitar, y_Capacitar)  # Entrenar el modelo con datos de entrenamiento

# Realizar predicciones en el conjunto de prueba
y_prediccion = regresar.predict(x_Capacitar)


# visualizar los datos de entranamiento
plt.scatter(x_Capacitar, y_Capacitar, color="blue")
plt.plot(x_Prueba, regresar.predict(x_Prueba), color="black")
plt.title("Sueldo por anios de experiencia")
plt.xlabel("Anios de experiencia")
plt.ylabel("sueldo base al trabajo")
plt.show()

# visualizar los datos de pruebas o entrenamiento
plt.scatter(x_Prueba, y_Prueba, color="purple")
plt.plot(x_Prueba, regresar.predict(x_Prueba), color="black")
plt.title("Sueldo por anios de experiencia")
plt.xlabel("Anios de experiencia")
plt.ylabel("sueldo base al trabajo")
plt.show()

# aprendizaje automatizado Para Python y los resultados son mayor mente sactisfactorio