# Workshop-3



### CMD vs ENTRYPOINT

En docker `CMD` se define los comandos o parametros por defecto en el contenedor, y es la opción recomendada si lo que se necesita es ejecutar un comando por defecto. 

`ENTRYPOINT` es similar a `CMD`  pero es usado para configurar el ejecutable que será ejecutado (valga la redundancia) cuendo inicie el contenedor, es decir "nos permite configurar en contenedor que *correra* como ejecutable"

#### caso de uso:

si se esta construyendo una imagen de un sólo uso, como por ejemplo nginx para montar un servidor web, lo mejor es usar `ENTRYPOINT`  para especificar la ruta al binario del servidor con cualquier argumento obligatorio.

#### referencias

[Demystifying ENTRYPOINT and CMD in Docker | AWS Open Source Blog](https://aws.amazon.com/blogs/opensource/demystifying-entrypoint-cmd-docker/)

[Docker CMD VS Entrypoint commands: What&#039;s the difference?](https://phoenixnap.com/kb/docker-cmd-vs-entrypoint)

[docker - What is the difference between CMD and ENTRYPOINT in a Dockerfile? - Stack Overflow](https://stackoverflow.com/questions/21553353/what-is-the-difference-between-cmd-and-entrypoint-in-a-dockerfile)

[Dockerfile reference | Docker Documentation](https://docs.docker.com/engine/reference/builder/)



### Relación `run` y tamaño del Dockerfile

El comando `run` afecta al tamaño del dockerfile se usa muchas veces (a mayor cantidad de instrucciones run, mayor es el tamaño de la imagen) en este caso particular la diferencia no llega a ser noria porque la cantidad de runs es poca (2 runs) en caso tal de aunmentar esta cantidad de instrucciones el tamaño aumentaria de una forma un poco mas notable.
