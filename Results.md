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



