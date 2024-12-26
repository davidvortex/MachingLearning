#DATOS CATEGORICOS
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
