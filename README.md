# sd-workshop3

### # 1.  Crear Dockerfile 

Para la realización de este workshop, se creó un Dockerfile. En el Dockerfile se incluyeron las intrucciones para hacer un scraping de la página de ICESI.

Para logar dicha configuración, primero se instalaron los recursos necesarios para el funcionamiento de apache2 y el comando wget que permite descargar el index html de icesi:

	`RUN apt update -y`
	`RUN apt install -y apache2`
	`RUN apt install wget `

Posterior a esto, en el directorio  /var/www/html/  se descargó el index.html de icesi.
Los comando para realizar dicha configuración fueron ( se amitieron ciertos comandos del ejecutable de Dockerfile) :

	`WORKDIR /var/www/html/`
	`RUN rm index.html`
	`RUN wget www.icesi.edu.co`

Posteriormente mediante el comando docker `build -t image_name` se creó la la imagen , y  se subió al siguiente repositorio de dockerhub.

Repositiorio de la imagen https://hub.docker.com/r/jair2/todo-angular 

### 2. Diferencia entre CMD y ENTRYPOINT

El comando CMD, lo que hace es definir los parámetros que serán utilizados en el ejecutable del contenedor. Meintras que el comando ENTRYPOINT, define cuál es el ejecutable principal que se va a utilizar en el contenedor.
Ambos comandos pueden ser usados de forma conjunta con el comando CMD, en el cuál se agragan los valores que usa el ENTRYPOINT. Los camndos por separado son (a manera de ejemplo):

	`CMD ["-D", "FOREGROUND"]`
	`ENTRYPOINT ["/usr/sbin/httpd"]`

y juntos serían de la siguiente forma: 

	`CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"] `

### 3. Analizar pesos(MB) de imagenes cuando: Tenemos varios RUN en el dockerfile y cuando tenemos un solo RUN en el dockerfile. 

Al realizar la prueba de las imagenes, una con múltiples comado RUN y otra con tan solo 2 RUN, se pudo observar que el tamaño de la imagen no presentó cambios significativos. Por lo tanto se puede decir que la cantidad de veces que este comando se use en la construcción de la imagen no afectará el tamaño de la misma. 
En la imagen llamada, comparacion.png se incluye un screnshoot de los resultados. 
