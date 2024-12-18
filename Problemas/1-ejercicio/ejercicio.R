#plantilla para preposesar la base de datos
# importar el dataset
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
























