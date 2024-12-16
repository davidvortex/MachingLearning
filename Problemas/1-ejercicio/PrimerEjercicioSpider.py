import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# esta caracteristica sirve para leer mi datos del excel
dataset = pd.read_csv('Data.csv')
# localizar por pilas
x = dataset.iloc[:,:-1].values #quiero recibir todas las columnos ecepto la ultima que es la que no me interesa
# ya que queremos predecir la ultima columna
y = dataset.iloc[:,:3].values # selecciono la columna de interes

from sklearn.impute import SimpleImputer
# Importamos SimpleImputer de scikit-learn para manejar valores faltantes en el dataset.

# Configuración del imputador para manejar valores faltantes
imputer = SimpleImputer(missing_values=np.nan, strategy="mean")
# Creamos una instancia de SimpleImputer, configurada para reemplazar valores faltantes (NaN) 
# con la media de cada columna.

# Ajustamos el imputador a las columnas que contienen datos faltantes
imputer = imputer.fit(x[:, 1:3])
# Aplicamos el método fit() para calcular la media de las columnas seleccionadas (1 y 2). 
# Esto prepara al imputador para realizar la transformación.

# Reemplazamos los valores faltantes en las columnas seleccionadas
x[:, 1:3] = imputer.transform(x[:, 1:3])
# Usamos transform() para reemplazar los valores NaN con la media calculada previamente.
# Las columnas actualizadas se guardan nuevamente en `x`.

