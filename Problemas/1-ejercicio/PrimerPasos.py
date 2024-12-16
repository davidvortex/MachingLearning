# Importar las librer�as necesarias para la manipulaci�n de datos, c�lculos num�ricos y visualizaci�n
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


# Leer el archivo CSV que contiene los datos
datos = pd.read_csv("Data.csv")

# Seleccionar las caracter�sticas independientes (x) y la variable objetivo (y)
x = datos.iloc[:, :-1].values  # Selecciona todas las columnas excepto la �ltima como caracter�sticas independientes
y = datos.iloc[:, -1].values   # Selecciona la �ltima columna como la variable objetivo

# Limpieza de datos: tratar valores NaN (valores faltantes)
from sklearn.impute import SimpleImputer  # Importar SimpleImputer para manejar valores faltantes

# Crear el imputador configurado para reemplazar valores NaN por la media de la columna
imputer = SimpleImputer(missing_values=np.nan, strategy="mean")

# Ajustar el imputador a las columnas deseadas (en este caso, columnas 1 y 2)
imputer = imputer.fit(x[:, 1:3])

# Reemplazar los valores faltantes en las columnas especificadas con la media calculada
x[:, 1:3] = imputer.transform(x[:, 1:3])

# Codificar datos categ�ricos para su uso en modelos de machine learning
from sklearn.preprocessing import LabelEncoder, OneHotEncoder  # Importar clases para codificaci�n
from sklearn.compose import ColumnTransformer  # Importar ColumnTransformer para transformar columnas espec�ficas

# Codificar la primera columna de x (categor�as a n�meros enteros)
labelencoder_x = LabelEncoder()  # Crear un codificador para etiquetas categ�ricas
x[:, 0] = labelencoder_x.fit_transform(x[:, 0])  # Transformar los valores categ�ricos en la primera columna

# Aplicar OneHotEncoder para convertir categor�as en variables dummy (columnas binarias)
column_transformer = ColumnTransformer(
    [("one_hot_encoder", OneHotEncoder(), [0])],  # Aplicar codificaci�n OneHot a la columna 0
    remainder="passthrough"  # Mantener las dem�s columnas sin cambios
)
x = column_transformer.fit_transform(x)  # Transformar el conjunto de caracter�sticas

# Codificar la variable objetivo (y) si tambi�n es categ�rica
labelencoder_y = LabelEncoder()  # Crear un codificador para etiquetas categ�ricas
y = labelencoder_y.fit_transform(y)  # Transformar la variable objetivo categ�rica a num�rica

# Imprimir los resultados para verificar el procesamiento
print("Caracter�sticas (x):")  # Imprimir las caracter�sticas transformadas
print(x)
print("Variable objetivo (y):")  # Imprimir la variable objetivo transformada
print(y)

# Dividir el conjunto de datos en subconjuntos de entrenamiento y prueba
from sklearn.model_selection import train_test_split  # Importar la funci�n para dividir datos en entrenamiento y prueba

# Dividir las caracter�sticas (x) y la variable objetivo (y) en subconjuntos de entrenamiento y prueba
x_prediccion, x_entrenamiento, y_prediccion, y_entrenamiento = train_test_split( #explico son 4 variables
    x,               # Conjunto de caracter�sticas independientes
    y,               # Variable objetivo
    test_size=0.2,   # Porcentaje del conjunto total que ser� utilizado para la prueba (20%)
    random_state=0   # Semilla para garantizar la reproducibilidad de los resultados
)
# Nota: 
# - `x_entrenamiento` y `y_entrenamiento` contienen los datos para entrenar el modelo.
# - `x_prediccion` y `y_prediccion` se usar�n para evaluar el modelo en datos no vistos.


















