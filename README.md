# Workshop \#3 
------------------

Se crearon dos carpetas, cada una con su propio Dockerfile: DockerfileInicial y DockerfileUnRun. Ambos Dockerfile contienen pasos para realizar scrapping de la pagina web:

[Universidad Icesi](https://www.icesi.edu.co)

La diferencia entre ambos Dockerfile es la cantidad de comandos RUN que contienen. Mientras que el primero tiene 7 lineas utilizando este comando, el segundo colapsa esas 7 lineas en solo 2.

Los datos de las imagenes se peden ver en la captura que se muestra a continuacion, siendo "variosrun" el tag de la imagen creada partir del primer Dockerfile, y "unrun" el tag de la imagen creada a partir del segundo Dockerfile:

![Lista de imagenes](https://raw.githubusercontent.com/MarceHM/sd-workshop3/blob/main/imagenesDocker.png)

Como se puede ver, ambas imagenes pesan lo mismo (11.6.MB), a pesar de que la cantidad de lineas de cada Dockerfile es distinta. De esto se puede decir que la cantidad de lineas en un Dockerfile no influye en el peso de la imagen a partir de el.

### Diferencia entre CMD y ENTRYPOINT

Ambos comandos funcionan y se utilizan de manera distinta: **ENTRYPOINT** define el ejecutable principal que un contenedor va a utlizar (por defecto es /bin/sh -c), mientras que **CMD** define los parametros que seran pasados al ejecutable.

Sin embargo, se puede pasar la ruta de un ejecutable como parametro mediante **CMD**, haciendo posible que se utilice el ejecutable especificado pero sin volverlo el ejecutable principal del contenedor, pues no se especifica en el **ENTRYPOINT**.
