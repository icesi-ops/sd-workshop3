# sd-workshop3 - Brayan S. Garcés

## Docker image
staga08/todo-angular



## Diferencia entre CMD y ENTRYPOINT
La diferencia que hay entre estos dos comandos es que, mientras que el comando CMD pone comandos y/o parametros por default, que pueden ser sobreescritos desde la linea de comando cuando el contenedor docker arranca, el comando ENTRYPOINT configura un contenedor que correrá como un ejecutable.

## Analisís diferencia de pesos con diferentes RUN

La diferencia es casi que nula en este conexto, ya que teniendo en cuenta el funcionamiento de los RUN en una docker image (que cada uno de estos RUN agrega una capa más al image y por tanto el tamaño de esta incrementa), al ser en este image usados solo 2 RUN, el que haya uno mas o menos, hará una diferencia tan pequeña que basicamente no se tiene en cuenta, esto cambiaria en el caso de que la cantidad de RUNs fuera mucho mayor, haciendo asi que si aumentara el tamaño del image, por lo cual es recomendado optimizar el codigo y concatenar, haciendo uso del && para realizar varias acciones en un solo RUN

Fuentes: 
https://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/
https://phoenixnap.com/kb/docker-image-size