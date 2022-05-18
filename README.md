# Microservice A

docker build -t sleeptight/microservice-a .
docker run -d -t -p 8080:8080 sleeptight/microservice-a

https://hub.docker.com/repository/docker/sleeptight/microservice-a

# Docker compose

docker build -t sleeptight/docker-compose .
docker-compose up

https://hub.docker.com/repository/docker/sleeptight/docker-compose

# aik-app-api

docker build -t sleeptight/aik-app-api .
docker run -d -t -p 3000:3000 sleeptight/aik-app-api

https://hub.docker.com/repository/docker/sleeptight/aik-app-api

# aik-app-ui

docker build -t sleeptight/aik-app-ui .
docker run -d -t -p 3030:3030 sleeptight/aik-app-ui

https://hub.docker.com/repository/docker/sleeptight/aik-app-ui