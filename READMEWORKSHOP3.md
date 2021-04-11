# sd-workshop3
## TODO:

- Crear Dockerfile y subirlo al dockerhub de la sgnte app --> https://github.com/ikermatias/todo-angular
- Investigar la diferencia entre CMD y ENTRYPOINT
- Analizar pesos(MB) de imagenes cuando: Tenemos varios RUN en el dockerfile y cuando tenemos un solo RUN en el dockerfile
- DELIVER: Readme.md que contenga el nombre de la imagen que construyeron: EL resultado de la investigación.

## Entrypoint

El entrypoint puede ejecutar un comando pero no puede pasar argumentos para que se corran en el contenedor, solo ejecuta y esta pensado para iniciar comandos por defecto cuando inicia el contenedor.

## CMD

El CMD puede ejecutar un comando y tiene los parametros a usar con el ejecutable.

## Analizar pesos (MB)

Cada comando en Dockerfile crea una capa y cada capa se almacena en cache lo cual aumenta su tamaño.

## Deliver

El nombre de la imagen es todoangular:angular-app

