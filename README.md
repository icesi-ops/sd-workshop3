# sd-workshop3
Maria Alejandra Estacio Ramirez

Repor for workshop3
- Create dockerfile for the next code -> https://github.com/icesi-ops/training_docker/tree/master/02_docker_python and push it to dockerhub
## dockerfile
    FROM python:3.8-alpine
    RUN mkdir /app
    ADD . /app
    WORKDIR /app
    RUN pip install -r requirements.txt
    CMD ["python", "sources/microservice_a.py"]
  
 ![image](https://user-images.githubusercontent.com/44929102/169163411-eed05925-d0f0-4ecb-84eb-1542d807430d.png)
![image](https://user-images.githubusercontent.com/44929102/169163520-04e89f9a-dcef-4220-87d0-9aaf8d7ab9d0.png)

## Docker hub
![image](https://user-images.githubusercontent.com/44929102/169163800-35696746-9b7d-4623-94df-5b8bc6217b8b.png)

- Create dockerfiles for the next code -> https://github.com/icesi-ops/training_docker/tree/master/04_docker_compose/00_intro and push it to dockerhub
## Dockerfile
    FROM python:3.8-alpine
    RUN mkdir /app
    ADD . /app
    WORKDIR /app
    RUN pip install -r requirements.txt
    EXPOSE 5000
    CMD ["python", "app.py"]
    
 ![image](https://user-images.githubusercontent.com/44929102/169164089-54b8a9db-1c2c-4750-a0c0-e8da5d792e0a.png)

![image](https://user-images.githubusercontent.com/44929102/169164443-98816e00-2a05-4633-ac31-524b4312d78c.png)
  
 ## Docker hub
![image](https://user-images.githubusercontent.com/44929102/169164329-35c5a950-1f15-4254-8e33-efcb21687b13.png)

  
- Create dockerfiles for the next code -> https://github.com/icesi-ops/aik-portal aik-ui and aik-api and push it to dockerhub

## Dockerfile
    FROM node:latest
    COPY . /app
    WORKDIR /app
    RUN npm install
    CMD ["node","server"]
 
![image](https://user-images.githubusercontent.com/44929102/169164648-ba386acb-a046-4a42-80ee-06a124b2da1a.png)
![image](https://user-images.githubusercontent.com/44929102/169164671-0e78ae25-cb99-4d5b-aca4-90f3a00c51a0.png)
![image](https://user-images.githubusercontent.com/44929102/169164704-7af33dae-44e8-4352-9a68-b427c26044c2.png)
![image](https://user-images.githubusercontent.com/44929102/169164789-7e878612-233b-4e4c-bf5b-6afb28a79f7e.png)

 ## Docker hub
 ![image](https://user-images.githubusercontent.com/44929102/169164877-e26ec13b-1e96-4b48-9469-37599ecb80e5.png)

 
 
