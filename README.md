# sd-workshop3

Nombre de la imagen: *juanchovelezpro/todo-app-angular:latest*


- La diferencia entre CMD y ENTRYPOINT:

CMD define un ejecutable predeterminado de una imagen Docker. Se puede correr la imagen como base de un contenedor sin agregar argumentos de linea de comandos. En ese caso, el contenedor corre el proceso especificado por el comando CMD. Si se agrega un argumento al *docker run* entonces se sobreescribe el CMD.

Por otro lado, ENTRYPOINT es usado para configurar cómo el contenedor debe correr. Tal cual como CMD, se necesita especificar un comando y parámetros. ¿La diferencia con CMD? Es que no se puede sobreescribir la instrucción ENTRYPOINT ak agregar parametros de linea de comandos al comando *docker run*. Debido a esto, al optar por esta instrucción, el contenedor está especificamente construido para tal uso.


- Análisis de Pesos según cantidad de RUN en Dockerfile:

Al principio tenía un dockerfile con al menos 5 RUN y luego lo optimicé a 1, en cuanto al peso en MB de las imágenes con las diferentes cantidades de RUN no hubo diferencia alguna, pues ambas imágenes quedaron con un peso de 31MB. Sin embargo, esto es debido a que hay una pequeña cantidad de RUN, si la cantidad de RUN es en gran cantidad si afecta al peso de la imagen.
