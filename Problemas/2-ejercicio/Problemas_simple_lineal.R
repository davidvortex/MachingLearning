# Regresion Lineal Simple

dataset = read.csv('C:/Users/david/Music/MachingLearning/Problemas/2-ejercicio/Salario_Data.csv')


library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
# Conjunto de entrenamiento (datos donde split es TRUE)
entrenamiento_enviar = subset(dataset, split == TRUE)

# Conjunto de prueba (datos donde split es FALSE)
prueba_enviar = subset(dataset, split == FALSE)


# escalado de valores
# entrenamiento_enviar[,2:3] = scale(entrenamiento_enviar[,2:3])
# prueba_enviar[,2:3] = scale(prueba_enviar[,2:3])

# Ajustar el modelo de regresionj lineal simple con el conjunto de entrenaimiento
regresar = lm(formula = Salary ~ YearsExperience, data = entrenamiento_enviar) #se tiene que parecer las variables del dataset = YearsExperience

# Predicir resultados con el conjunto de prueba
y_prediccion = predict(regresar, newdata = prueba_enviar)

# Visualizar resultados del conjunto de entrenamiento
ggplot(data = entrenamiento_enviar, aes(x = YearsExperience)) +
  # Puntos de los datos reales
  geom_point(aes(y = Salary), color = "blue") +
  # Línea del modelo de regresión
  geom_line(aes(y = predict(regresar, newdata = entrenamiento_enviar)), color = "green") +
  # Etiquetas y título
  ggtitle("sueldo vs años de experiencia (conjuento de entrenamiento)") +
  xlab("Años de experiencia")+
  ylab("sueldo (en $)")

# Visualizar resultados del conjunto de prueba
ggplot(data = prueba_enviar, aes(x = YearsExperience)) +
  # Puntos de los datos reales
  geom_point(aes(y = Salary), color = "blue") +
  # Línea del modelo de regresión
  geom_line(aes(y = predict(regresar, newdata = prueba_enviar)), color = "green") +
  # Etiquetas y título
  ggtitle("sueldo vs años de experiencia (conjuento de prueba)") +
  xlab("Años de experiencia")+
  ylab("sueldo (en $)")




