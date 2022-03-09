FROM node:latest
LABEL API docker image

COPY . /app
WORKDIR /app
RUN npm install

EXPOSE 3000
CMD [ "node","server" ]