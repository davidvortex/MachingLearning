#plantilla para preposesar la base de datos
#importar el dataset
#la posicion empieza de 1 y no en cero en spider
dataset = read.csv('C:/Users/david/Music/MachingLearning/Problemas/1-ejercicio/Data.csv')

# Tratamiento de los valores NaN en la columna "Age"
dataset$Age = ifelse(is.na(dataset$Age), 
                     # Condición: Verifica si hay valores NA en la columna "Age". 
                     # La función `is.na()` devuelve TRUE para las celdas que contienen NA.
                     
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)), 
                     # Acción para valores NA: Usa la función `ave()` para calcular la media de la columna "Age".
                     # `na.rm = TRUE` asegura que los valores NA sean ignorados al calcular la media.
                     # La media calculada se asignará a las celdas donde `is.na(dataset$Age)` sea TRUE.
                     dataset$Age)
# Acción para valores no NA: Mantén los valores originales de "Age" sin cambios.

dataset$Salary = ifelse(is.na(dataset$Salary), 
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)), 
                     dataset$Salary)

# Codificar las variables categóricas en el dataset

# Convertir la columna "Country" en una variable categórica con niveles y etiquetas numéricas
dataset$Country = factor(dataset$Country,  # Selecciona la columna "Country" del dataset
                         levels = c("France", "Spain", "Germany"),  # Especifica los valores únicos (niveles)
                         labels = c(1, 2, 3))  # Asigna etiquetas numéricas a cada nivel

# Convertir la columna "Purchase" en una variable categórica binaria (No = 0, Yes = 1)
dataset$Purchase = factor(dataset$Purchase,  # Selecciona la columna "Purchase" del dataset
                          levels = c("No", "Yes"),  # Define los posibles valores de la variable
                          labels = c(0, 1))  # Asigna etiquetas numéricas (0 para No y 1 para Yes)


# Dividir los datos en conjuntos de entrenamiento y prueba
# Instalar el paquete caTools si no está instalado
# install.packages("caTools")  # Ejecutar esta línea solo si no tienes caTools instalado

# Cargar la biblioteca caTools para dividir los datos
library(caTools)
# Establecer una semilla para asegurar la reproducibilidad de los resultados
set.seed(123)

# Dividir los datos en entrenamiento y prueba
# sample.split devuelve un vector lógico que indica a qué conjunto (entrenamiento o prueba) pertenece cada fila
dividir = sample.split(dataset$Purchased, SplitRatio = 0.8)  
# `dataset$Purchased` es la variable objetivo que se utiliza como referencia
# `SplitRatio = 0.8` indica que el 80% de los datos serán para ejercicio y el 20% para testeo

# Crear el conjunto de entrenamiento seleccionando las filas donde `dividir` es TRUE
prediccion_enviar = subset(dataset, dividir == TRUE)

# Crear el conjunto de prueba seleccionando las filas donde `dividir` es FALSE
testeo_enviar = subset(dataset, dividir == FALSE)


# Escalado de valores: Normalizamos las columnas seleccionadas para que tengan media 0 y desviación estándar 1
# Escalar las columnas 2 y 3 del conjunto de predicción
prediccion_enviar[, 2:3] = scale(prediccion_enviar[, 2:3])  
# `scale()` ajusta cada columna seleccionada para que tenga media 0 y desviación estándar 1
# Esto es útil para modelos que son sensibles a las magnitudes de las variables

# Escalar las columnas 2 y 3 del conjunto de prueba
testeo_enviar[, 2:3] = scale(testeo_enviar[, 2:3])  
# Aplica el mismo proceso de normalización al conjunto de prueba
# Nota: Las columnas deben contener valores numéricos para aplicar `scale()`. Si las columnas no están en formato
# numérico, primero hay que convertirlas.


####################### escalado de datos
# Convertir columnas seleccionadas a tipo entero si necesario
# Por ejemplo, si las columnas contienen valores categóricos codificados, se convierten antes del escalado:
prediccion_enviar[, 2:3] = as.integer(prediccion_enviar[, 2:3])  # Asegurar que las columnas sean enteros
testeo_enviar[, 2:3] = as.integer(testeo_enviar[, 2:3])          # Asegurar lo mismo en el conjunto de prueba


















