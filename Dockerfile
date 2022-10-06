FROM ubuntu:latest

WORKDIR /var/www/html/

RUN apt update
RUN apt-get install -y nodejs

RUN apt install -y python2

COPY package.json ./
COPY package-lock.json ./
ENV PORT=8080
ENV AUTH_API_ADDRESS=http://127.0.0.1:8000 
ENV TODOS_API_ADDRESS=http://127.0.0.1:8082

RUN apt-get install -y npm
RUN npm install
RUN npm build

COPY . .

EXPOSE 8080

CMD ["npm", "start"]