Instructions

1. docker network create aik-app
2. docker run --network aik-app -p 3000:3000 --name aik-app-api --hostname aik-app-api -d gallo9923/aik-app-api 
3. docker run --network aik-app -p 3030:3030 --name aik-app-ui -e BACK_HOST=aik-app-api -d gallo9923/aik-app-ui:latest

Note: Check the different photos to see the container running.