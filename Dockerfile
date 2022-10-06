FROM ubuntu:20.04


RUN mkdir /app
WORKDIR /app

COPY . .

COPY package*.json ./


ENV PORT=8080 
ENV AUTH_API_ADDRESS=http://127.0.0.1:8000 
ENV TODOS_API_ADDRESS=http://127.0.0.1:8082

RUN apt update
RUN apt install -y python2
RUN apt install -y nodejs
RUN apt install -y npm

RUN npm install
RUN npm build

EXPOSE 8080

CMD [ "npm", "start" ]
