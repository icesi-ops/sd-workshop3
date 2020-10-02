# sd-workshop3
Report for workshop3

Se crearon los dos dockerfiles utilizando la imagen mas reciente de alpine.
Uno de los dockerfile contiene 6 comandos RUN con los pasos necesarios para realizar el web scraping de la pagina de la universidad ICESI.
El otro realiza la misma funcion, pero solo tiene 2 comandos RUN.

REPOSITORY                            TAG                 IMAGE ID            CREATED              SIZE
german2404/workshop3alpine            0.0.1               6b4b1412e14f        4 seconds ago        11.6MB
german2404/workshop3alpineoptimized   0.0.1               3a3a51e181d0        About a minute ago   11.6MB

Como se observa, no existe ninguna diferencia en el tamano final de la imagen.
Comando utilizados para la creacion de las imagenes:
docker build -t german2404/workshop3alpine:0.0.1 .
docker build -t german2404/workshop3alpineoptimized:0.0.1 .

Posteriormente, se corren los contenedores y se realiza la prueba para obtener el html de la pagina
docker run -d -p 8080:80 --name scrapringalpine german2404/workshop3alpine:0.0.1
curl 127.0.0.1:8080

docker run -d -p 8081:80 --name scrapringalpineoptimized german2404/workshop3alpineoptimized:0.0.1
curl 127.0.0.1:8081

El resultado de ambos curls es satisfactorio.

Las imagenes pueden ser obtenidas de:
docker pull german2404/workshop3alpine:0.0.1
docker pull german2404/workshop3alpineoptimized:0.0.1

Respecto a las instrucciones CMD y ENTRYPOINT:
La instruccion CMD define el set de instrucciones que se ejecutara cuando se inicie el contenedor sin pasarle ningun argumento. Esto quiere decir que es como la funcion ejecutable por defecto. Sin embargo, al pasar un argunmento, esto cambia, y se ejecuta el argumento en vez del CMD.

ENTRYPOINT es muy parecido. Tambien es un set de instrucciones que se ejecutra cuando se inicie el contenedor. La diferencia principal es que estas instrucciones se ejecutan si o si, sin importar los argumentos que se le pasen a la funcion run. Es decir, no es sobreescribible.

Lo mas normal y recomendado es usar una combinacion de ambas instrucciones. Se usa CMD para settear los parametros por default del contenedor, y ENTRYPOINT para definir el ejecutable.



