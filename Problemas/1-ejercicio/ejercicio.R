#plantilla para preposesar la base de datos
#importar el dataset
#la posicion empieza de 1 y no en cero en spider
dataset = read.csv('C:/Users/david/Music/MachingLearning/Problemas/1-ejercicio/Data.csv')

# Tratamiento de los valores NaN en la columna "Age"
dataset$Age = ifelse(is.na(dataset$Age), 
                     # Condici�n: Verifica si hay valores NA en la columna "Age". 
                     # La funci�n `is.na()` devuelve TRUE para las celdas que contienen NA.
                     
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)), 
                     # Acci�n para valores NA: Usa la funci�n `ave()` para calcular la media de la columna "Age".
                     # `na.rm = TRUE` asegura que los valores NA sean ignorados al calcular la media.
                     # La media calculada se asignar� a las celdas donde `is.na(dataset$Age)` sea TRUE.
                     dataset$Age)
# Acci�n para valores no NA: Mant�n los valores originales de "Age" sin cambios.

dataset$Salary = ifelse(is.na(dataset$Salary), 
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)), 
                     dataset$Salary)

# Codificar las variables categ�ricas en el dataset

# Convertir la columna "Country" en una variable categ�rica con niveles y etiquetas num�ricas
dataset$Country = factor(dataset$Country,  # Selecciona la columna "Country" del dataset
                         levels = c("France", "Spain", "Germany"),  # Especifica los valores �nicos (niveles)
                         labels = c(1, 2, 3))  # Asigna etiquetas num�ricas a cada nivel

# Convertir la columna "Purchase" en una variable categ�rica binaria (No = 0, Yes = 1)
dataset$Purchase = factor(dataset$Purchase,  # Selecciona la columna "Purchase" del dataset
                          levels = c("No", "Yes"),  # Define los posibles valores de la variable
                          labels = c(0, 1))  # Asigna etiquetas num�ricas (0 para No y 1 para Yes)


# Dividir los datos en conjuntos de entrenamiento y prueba
# Instalar el paquete caTools si no est� instalado
# install.packages("caTools")  # Ejecutar esta l�nea solo si no tienes caTools instalado

# Cargar la biblioteca caTools para dividir los datos
library(caTools)
# Establecer una semilla para asegurar la reproducibilidad de los resultados
set.seed(123)

# Dividir los datos en entrenamiento y prueba
# sample.split devuelve un vector l�gico que indica a qu� conjunto (entrenamiento o prueba) pertenece cada fila
dividir = sample.split(dataset$Purchased, SplitRatio = 0.8)  
# `dataset$Purchased` es la variable objetivo que se utiliza como referencia
# `SplitRatio = 0.8` indica que el 80% de los datos ser�n para ejercicio y el 20% para testeo

# Crear el conjunto de entrenamiento seleccionando las filas donde `dividir` es TRUE
prediccion_enviar = subset(dataset, dividir == TRUE)

# Crear el conjunto de prueba seleccionando las filas donde `dividir` es FALSE
testeo_enviar = subset(dataset, dividir == FALSE)


# Escalado de valores: Normalizamos las columnas seleccionadas para que tengan media 0 y desviaci�n est�ndar 1
# Escalar las columnas 2 y 3 del conjunto de predicci�n
prediccion_enviar[, 2:3] = scale(prediccion_enviar[, 2:3])  
# `scale()` ajusta cada columna seleccionada para que tenga media 0 y desviaci�n est�ndar 1
# Esto es �til para modelos que son sensibles a las magnitudes de las variables

# Escalar las columnas 2 y 3 del conjunto de prueba
testeo_enviar[, 2:3] = scale(testeo_enviar[, 2:3])  
# Aplica el mismo proceso de normalizaci�n al conjunto de prueba
# Nota: Las columnas deben contener valores num�ricos para aplicar `scale()`. Si las columnas no est�n en formato
# num�rico, primero hay que convertirlas.


####################### escalado de datos
# Convertir columnas seleccionadas a tipo entero si necesario
# Por ejemplo, si las columnas contienen valores categ�ricos codificados, se convierten antes del escalado:
prediccion_enviar[, 2:3] = as.integer(prediccion_enviar[, 2:3])  # Asegurar que las columnas sean enteros
testeo_enviar[, 2:3] = as.integer(testeo_enviar[, 2:3])          # Asegurar lo mismo en el conjunto de prueba


















