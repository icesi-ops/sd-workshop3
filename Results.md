***Punto 1

Para realizar el punto 2 necesitamos construir el siguiente dockerfile usando el comando 

~~~
  docker build -t nelsonq2424/dockerpython .
~~~

~~~
FROM alpine

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

COPY . /app
RUN pip install -r /app/requirements.txt

EXPOSE 8080
CMD ["/usr/bin/python", "/app/sources/microservice_a.py"]
~~~

Despues de construir la imagen corremos la aplicacion con:
~~~
  docker run nelsonq2424/dockerpython
~~~

![imagen](https://user-images.githubusercontent.com/44851531/168937945-8300703b-d2d6-47e0-80df-4b05c8a5eff3.png)

Ya que verificamos que todo funciona enviamos la imagen a dockerhub con el comando:

~~~
  sudo docker push nelsonq2424/dockerpython
~~~

***Punto 2

Para ejecutar el punto 2 podemos utilizar el mismo dockerfile utilizado en el punto anterior modificando las rutas de ejecucion del app.py

~~~
FROM alpine

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

COPY . /app
RUN pip install -r /app/requirements.txt

EXPOSE 8080
CMD ["/usr/bin/python", "/app/sources/microservice_a.py"]
~~~

Construimos la aplicacion con:

~~~
  docker build -t nelsonq2424/dockerpython2 .
~~~

Lo primero es crear una red de docker para que diferentes contenedores puedan comunicarse entre si:
```
  docker network create net1
```

Necesitamos un contenedor de Redis corriendo en el puerto 6379:
~~~
  docker run --name redis -p 6379 --network=net1 -d redis
~~~

Ahora corremos la app:
```
  docker run -p 5000 --network=net1 nelsonq2424/dockerpython2
```

![image](https://user-images.githubusercontent.com/44851531/168946810-59990a16-60c6-4ce3-9e94-60d3627b04bc.png)

Ahora publicamos la imagen en dockerhub con:

```
  sudo docker push nelsonq2424/dockerpython2
```

Todos los cambios necesarios para el punto 1 y 2 quedaron registrados en el repositorio:
https://github.com/bit2424/training_docker

***Punto 3

Empezamos con el dockerfile para desplegar el aik-app-ui:
```
FROM node:latest
COPY . /app
WORKDIR /app
RUN npm install
CMD ["node","server"]
```

Para construir la aplicacion ejecutamos (Recuerda estar dentro de la carpeta de /aik_app_ui):
```
  docker build -t nelsonq2424/aik_app_ui .
```

Para correr la aplicacion ejecutamos:
```
  docker run -d -t -p 3030:3030 nelsonq2424/aik_app_ui
```

![image](https://user-images.githubusercontent.com/44851531/168950464-8b59595a-864f-40dd-98f0-2c95baa902ca.png)


Para enviar la imagen a docker hub ejectamos:
```
  sudo docker push nelsonq2424/aik_app_ui
```

Continuamos con el dockerfile para desplegar el aik-app-api:
```
FROM node:latest
COPY . /app
WORKDIR /app
RUN npm install
CMD ["node","server"]
```

Para construir la aplicacion ejecutamos (Recuerda estar dentro de la carpeta de /aik_app_api):
```
  docker build -t nelsonq2424/aik_app_api .
```

Para correr la aplicacion ejecutamos:
```
  docker run -d -t -p 3030:3030 nelsonq2424/aik_app_api
```
Ahora probamos algunos endpoints del proyecto

![image](https://user-images.githubusercontent.com/44851531/168950917-55178afa-d133-4d4e-9ef0-b364cc3e5e63.png)
![image](https://user-images.githubusercontent.com/44851531/168950734-9879129a-b64a-43fd-90c0-29f08b15849b.png)


Para enviar la imagen a docker hub ejectamos:
```
  sudo docker push nelsonq2424/aik_app_api
```

El repositorio con los archivos mostrados en el punto 3 se encuentra aqui:
https://github.com/bit2424/aik-portal

