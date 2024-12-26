# Importar las librerías necesarias para la manipulación de datos, cálculos numéricos y visualización
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Leer el archivo CSV que contiene los datos
datos = pd.read_csv("Data.csv")

# Seleccionar las características independientes (x) y la variable objetivo (y)
x = datos.iloc[:, :-1].values  # Selecciona todas las columnas excepto la última como características independientes
y = datos.iloc[:, -1].values   # Selecciona la última columna como la variable objetivo

# Limpieza de datos: tratar valores NaN (valores faltantes)
from sklearn.impute import SimpleImputer  # Importar SimpleImputer para manejar valores faltantes

# Crear el imputador configurado para reemplazar valores NaN por la media de la columna
imputer = SimpleImputer(missing_values=np.nan, strategy="mean")

# Ajustar el imputador a las columnas deseadas (en este caso, columnas 1 y 2)
imputer = imputer.fit(x[:, 1:3])

# Reemplazar los valores faltantes en las columnas especificadas con la media calculada
x[:, 1:3] = imputer.transform(x[:, 1:3])

# Codificar datos categóricos para su uso en modelos de machine learning
from sklearn.preprocessing import LabelEncoder, OneHotEncoder  # Importar clases para codificación
from sklearn.compose import ColumnTransformer  # Importar ColumnTransformer para transformar columnas específicas

# Codificar la primera columna de x (categorías a números enteros)
labelencoder_x = LabelEncoder()  # Crear un codificador para etiquetas categóricas
x[:, 0] = labelencoder_x.fit_transform(x[:, 0])  # Transformar los valores categóricos en la primera columna

# Aplicar OneHotEncoder para convertir categorías en variables dummy (columnas binarias)
column_transformer = ColumnTransformer(
    [("one_hot_encoder", OneHotEncoder(), [0])],  # Aplicar codificación OneHot a la columna 0
    remainder="passthrough"  # Mantener las demás columnas sin cambios
)
x = column_transformer.fit_transform(x)  # Transformar el conjunto de características

# Codificar la variable objetivo (y) si también es categórica
labelencoder_y = LabelEncoder()  # Crear un codificador para etiquetas categóricas
y = labelencoder_y.fit_transform(y)  # Transformar la variable objetivo categórica a numérica

# Imprimir los resultados para verificar el procesamiento
print("Características (x):")  # Imprimir las características transformadas
print(x)
print("Variable objetivo (y):")  # Imprimir la variable objetivo transformada
print(y)

# Dividir el conjunto de datos en subconjuntos de entrenamiento y prueba
from sklearn.model_selection import train_test_split  # Importar la función para dividir datos en entrenamiento y prueba

# Dividir las características (x) y la variable objetivo (y) en subconjuntos de entrenamiento y prueba
x_prediccion, x_entrenamiento, y_prediccion, y_entrenamiento = train_test_split( #explico son 4 variables
    x,               # Conjunto de características independientes
    y,               # Variable objetivo
    test_size=0.2,   # Porcentaje del conjunto total que será utilizado para la prueba (20%)
    random_state=0   # Semilla para garantizar la reproducibilidad de los resultados
)
# Nota: 
# - `x_entrenamiento` y `y_entrenamiento` contienen los datos para entrenar el modelo.
# - `x_prediccion` y `y_prediccion` se usarán para evaluar el modelo en datos no vistos.

# Escalar variables para normalizar sus valores y mejorar el rendimiento de los modelos de machine learning
from sklearn.preprocessing import StandardScaler  # Importar la clase StandardScaler para la estandarización de datos


#### escalado de datos
# Crear un objeto escalador que se utilizará para estandarizar los datos
escalador_x = StandardScaler()  

# Ajustar el escalador a los datos de entrenamiento (calcular la media y desviación estándar) 
# y transformar los datos para que tengan media 0 y desviación estándar 1
x_entre = escalador_x.fit_transform(x_entrenamiento)  

# Aplicar la transformación al conjunto de prueba usando los parámetros calculados en los datos de entrenamiento
# (media y desviación estándar previamente calculadas)
x_predi = escalador_x.transform(x_prediccion)


















