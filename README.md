# sd-workshop3
### 1. DOCKER_PYTHON
#### Dockerfile
    FROM python:3

    WORKDIR /usr/src/app

    COPY requirements.txt ./
    RUN pip install --no-cache-dir -r requirements.txt

    COPY . .

    CMD [ "python", "sources/microservice_a.py" ]
![image](https://user-images.githubusercontent.com/47891444/168920733-70819039-f158-4acb-9cf1-d18b7a8b86af.png)
![image](https://user-images.githubusercontent.com/47891444/168921500-83cd57ea-721f-4fd9-9a77-333255ead692.png)
![image](https://user-images.githubusercontent.com/47891444/168921559-d8e59d44-6915-4774-805f-95ae9dea4d6a.png)

### 2. DOCKER_COMPOSE
#### Dockerfile
    FROM python:3.4-alpine
    WORKDIR /code
    ENV FLASK_APP=app.py
    ENV FLASK_RUN_HOST=0.0.0.0
    RUN apk add --no-cache gcc musl-dev linux-headers
    COPY requirements.txt requirements.txt
    RUN pip install -r requirements.txt
    EXPOSE 5000
    COPY . .
    CMD ["python", "app.py"]
    
![image](https://user-images.githubusercontent.com/47891444/169143283-e1daab2b-6315-47ef-9aa6-0dd6fbde91aa.png)
![image](https://user-images.githubusercontent.com/47891444/168921913-69044044-05cd-49e3-be91-c0d14b8be1fe.png)
![image](https://user-images.githubusercontent.com/47891444/168921920-f71cae33-bf15-4978-ad7a-0afc104fb4c9.png)

### 3. AIK-PORTAL-MASTER
#### APP-API
#### Dockerfile 
    FROM node:16
    WORKDIR /code
    COPY package*.json ./
    RUN npm install
    COPY . .
    EXPOSE 3000
    CMD [ "node", "server.js" ]

![image](https://user-images.githubusercontent.com/47891444/168922246-d739a0c3-fb55-41a6-9f57-c9371dc2db11.png)
![image](https://user-images.githubusercontent.com/47891444/168922397-1c490690-a282-4455-96e2-5a33700822f5.png)
![image](https://user-images.githubusercontent.com/47891444/168922410-0e027807-3f9b-4bab-bb23-d3f5c4b96087.png)
![image](https://user-images.githubusercontent.com/47891444/168922418-8941426f-9cda-4dd3-8973-e895273b6532.png)


#### APP-UI
#### Dockerfile 
    FROM node:16
    WORKDIR /code
    COPY package*.json ./
    RUN npm install
    COPY . .
    EXPOSE 3030
    CMD [ "node", "server.js" ]
![image](https://user-images.githubusercontent.com/47891444/168922356-4a7f058f-d06d-4ec5-aa75-144b91c8d134.png)

