FROM node:latest
LABEL Docker Workshop

COPY . /app
WORKDIR /app
RUN npm install

EXPOSE 3030
CMD ["node","server"]