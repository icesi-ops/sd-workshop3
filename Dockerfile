FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /app

RUN apt update

RUN apt-get install -y curl
#RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - 
RUN apt-get install -y nodejs

RUN apt install -y python2

# install app dependencies
COPY package.json ./
COPY package-lock.json ./

ENV AUTH_API_ADDRESS=http://127.0.0.1:8000 
ENV TODOS_API_ADDRESS=http://127.0.0.1:8082

RUN apt-get install -y npm
RUN npm i
RUN npm build

# add app
COPY . ./

# start app
CMD ["npm", "start"] 