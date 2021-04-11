# DOCKER - Workshop 3
### Daniel Alejandro Cerquera Castro 

### Punto 1:
##### Nombre de la imagen construida
danielalejandrocerquera13/image-app

### Punto 2:
##### Diferencia entre CMD y ENTRYPOINT
Docker consta de dos tipos de instrucciones que permiten definir el proceso que se ejecuta en el contenedor.

Por un lado se encuentra la instrucción CMD, que se encarga de definir los comandos y parámetros predeterminados para el contenedor. En el caso que en el archivo Dockerfile se cuente con varias instrucciones CMD, solo se aplican las instrucciones de la última, los anteriores se anulan. 

El ENTRYPOINT, se utiliza cuando lo que se desea hacer es tener un contenedor con un ejecutable específico, los cuales a diferencia del CMD no se eliminan al iniciar el contenedor.

Tomado de: [https://phoenixnap.com/kb/docker-cmd-vs-entrypoint](https://phoenixnap.com/kb/docker-cmd-vs-entrypoint)

### Punto 3:
Después de realizar la ejecución del contenedor Docker, en un principio con varios RUN y posteriormente con un solo RUN en el dockerfile. Se observó, que el peso de la imagen se mantenía (31MB). Se puede deducir, que en este caso los tamaños se mantienen pues en el primer dockerfile solo fue necesario del uso de 3 instrucciones RUN  para su ejecución. Opino que si se tratara de un trabajo donde la cantidad de instrucciones RUN fueran mucho mayor podría existir una diferencia en los pesos (MB) de las imágenes.

