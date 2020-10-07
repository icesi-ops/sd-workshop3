# sd-workshop3
##Manual tasks

1 apt update
2 apt install apache2
Repor for workshop3

##Process

###Alpine sin mejorar
1 Crear el archivo DockerFile con la última versión de alpine
2 Adaptar el DockerFile con las funcionalidades y comandos que este emplea. Por ejemplo: apk.
3 Construir la imagen con Docker build
4 Continuar con el comando "Docker run y los respectivos parametros
5 Por último se comprueba con alejajessi/alpinew3:0.0.1 que funciona.

###Alpinea mejorado
En este Docker file ubicado en alejajessi/alpinew3mejor:0.0.2, se trato de acortar o mejorar reduciendo la cantidad de RUN que estaban en el archivo. Esto se realizó por medio de concatenación con "&&".


###Peso de imagenes
Como se visualiza en el screenshot, el peso de las imagenes no varia así sea más corto o no el DockerFile.

###CMD & ENTRYPOINT
