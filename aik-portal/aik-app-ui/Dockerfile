FROM node:latest
COPY . /app
WORKDIR /app
ENV BACK_HOST=aik-api
RUN npm install
EXPOSE 3030
CMD ["node","server"]
