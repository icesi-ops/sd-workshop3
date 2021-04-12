# Workshop 2

El siguiente es el link de la imagen en DockerHub: https://hub.docker.com/r/nelsonlopez69/todo-app


# ENTRYPOINT y CMD

La diferencia entre CMD y ENTRYPOINT es que con CMD, el comando y el/los párametros que se especiifcan, se puede "cambiar" cuando el usuario lance el contenedor. En cambio, con ENTRYPOINT no es posible sobrescribir el comando ni los argumentos especificados. Para esto usualmente se especifica en el ENTRYPOINT el comando como tal y en el CMD el parámetro de dicho comando, para que este sí pueda ser sobreescrito.

A continuación se muestra un ejemplo de un Dockerfile en cada caso:

Usando CMD:
```
FROM ubuntu:16.04
CMD ["/bin/date"]
```
Ejecución: 

```
$ docker build -t test .
$ docker run test
Tue Dec 19 10:37:43 UTC 2016
```

Pero con CMD es posible cambiar el comando al lanzar el contenedor:

```
$ docker run test /bin/hostname
bf0274ec8820
```

Como se puede evidenciar, en el CMD se había definido el comando "date",
pero al ejecutar el contenedor se puede especificar otro comando diferente y sobrescribirse,
en este caso el comando hostname.

Al usar ENTRYPONT, en cambio, el comando especificado no se puede sobrescribir 
y en ese sentido, se utiliza CMD para definir el parámetro de dicho comando
y asi permitir que este se pueda sobrescribir:

FROM ubuntu:16.04
ENTRYPOINT ["/bin/echo"]
CMD ["Hello"]

Ejecución:

$ docker build -t test .
$ docker run test
Hello

Al sobrescribir el parámetro:
```
$ docker run test Hi
Hi
```

Fuente: https://programacionymas.com/blog/docker-diferencia-entrypoint-cmd



# Análisis de tamaño de imágenes

En el archivo Dockerfile se evidencian dos comandos RUN, el primero para instalar npm, y el segundo para compilar la app. De acuerdo con eso, se lleva a cabo la primera prueba ejecutando ambos comandos por separado, RUN npm install y RUN npm run build, dando como resultado una imagen de 144 MB. Por otro lado, al ejecutar un segundo Dockerfile ,ejecutando los comandos anteriores en un RUN se obtuvo una imagen del mismo tamaño. 

De acuerdo con la documentación oficial de Docker, cada ejecución del comando RUN añade una nueva capa a dicha imagen del contenedor, siendo por esto recomendable que se puedan ejecutar los comandos en una misma instrucción RUN, para lograr que la imagen pese menos. Sin embargo, teniendo en cuenta que en este caso no hubo una variación en los tamaños de la imagen, se podría atribuir esto a que los cambios que se realizan en los filesystem por parte de cada ejecución del archivo Dockerfile, no son tan significativos como para representar mayor tamaño. Lo anterior teniendo en cuenta que durante cada etapa, se busca que todos los filesystems tengan el estado actual, luego de ejecutar el comando.

Fuente: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/




