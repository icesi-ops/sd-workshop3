## 02_docker_python
  ### Dockerfile
      FROM python:3.8-slim-buster
      WORKDIR /app
      COPY requirements.txt requirements.txt
      RUN pip3 install -r requirements.txt
      COPY . .
      CMD ["python3", "sources/microservice_a.py"]
      
  ### requerements.txt
   En mi caso tuve que actualizar las versiones de flask y agregar itsdangerous
   
      Flask==2.0.3
      itsdangerous==2.0.1

  ### Commands
    docker build -t ordonezmaria1/docker_python .
    docker run -d -t -p 5000:5000 ordonezmaria1/docker_python
  ### Screenshot
   ![image](https://user-images.githubusercontent.com/47904094/168922751-d2947533-0ace-4044-82db-1fa3c2012557.png)
   ![image](https://user-images.githubusercontent.com/47904094/168923019-8fa80102-e9bf-49f0-b0a2-9fb129867997.png)


## 04_docker_compose
  ### Dockerfile
    FROM python:3.8-slim-buster
    WORKDIR /app
    COPY requirements.txt requirements.txt
    RUN pip3 install -r requirements.txt
    COPY . .
    CMD ["python3", "app.py"]
    
  ### Commands
      docker build -t ordonezmaria1/intro .
      docker-compose up
  ### Screenshot
   ![image](https://user-images.githubusercontent.com/47904094/168923767-e6b969a3-0712-4334-879f-cc73aed8786a.png)
   ![image](https://user-images.githubusercontent.com/47904094/168923906-01586651-5465-48bc-96dc-69be76a2ff57.png)
## aik-portal
   ## aik-app-api
   ### aik-app-api dockerfile
      FROM node:10-alpine

      RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
      WORKDIR /home/node/app
      COPY package*.json ./
      USER node

      RUN npm install express --save
      RUN npm install

      COPY --chown=node:node . .
      EXPOSE 3000
      CMD [ "node", "server.js" ]
   ### Commands
      docker build -t ordonezmaria1/aik-app-api .
      docker run -d -t -p 3000:3000 ordonezmaria1/aik-app-api
   ### Screenshot
   ![image](https://user-images.githubusercontent.com/47904094/168925008-ea128150-6646-4084-b195-992062cd275d.png)
   ![image](https://user-images.githubusercontent.com/47904094/168924903-512d7995-5caa-4714-ace6-4594b02875f8.png)
   ![image](https://user-images.githubusercontent.com/47904094/168924950-448a8c19-4652-4346-ab07-2236e13983b7.png)
   ![image](https://user-images.githubusercontent.com/47904094/168925169-57f0f455-fc7b-4bc4-a152-f90ec3205f98.png)
   
   ## aik-app-ui
   ### aik-app-ui dockerfile
        FROM node:10-alpine

        RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
        WORKDIR /home/node/app
        COPY package*.json ./
        USER node

        RUN npm install express --save
        RUN npm i superagent
        RUN npm install

        COPY --chown=node:node . .
        EXPOSE 3030
        CMD [ "node", "server.js" ]
   ### Commands
      docker build -t ordonezmaria1/aik-app-ui .
      docker run -d -t -p 3030:3030 ordonezmaria1/aik-app-ui
   ### Screenshot 
   ![image](https://user-images.githubusercontent.com/47904094/168924707-3a3b27ef-cbd1-4c3a-890a-15fbb8f4433b.png)
   ![image](https://user-images.githubusercontent.com/47904094/168924801-7cfdc3e6-0270-4914-b43c-77dd0fc0c6cd.png)


## Imagenes en dockerhub
  https://hub.docker.com/r/ordonezmaria1/docker_python
  https://hub.docker.com/r/ordonezmaria1/intro
  https://hub.docker.com/r/ordonezmaria1/aik-app-api
  https://hub.docker.com/r/ordonezmaria1/aik-app-ui