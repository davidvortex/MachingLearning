import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

########## Datos Categoricos
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

################## Codificar datos
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





