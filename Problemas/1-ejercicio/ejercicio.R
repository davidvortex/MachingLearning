#plantilla para preposesar la base de datos
# importar el dataset
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
























