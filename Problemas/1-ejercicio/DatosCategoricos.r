#DATOS CATEGORICOS
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
