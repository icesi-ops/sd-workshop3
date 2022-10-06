FROM ubuntu:20.04

# Crear el directorio app
RUN mkdir /application/

# hacer la carpeta application el directorio de trabajo actual
WORKDIR /application/

# Copiar package.json y archivos similares si estan disponibles
COPY package*.json ./


ENV PORT=8080 
ENV AUTH_API_ADDRESS=http://127.0.0.1:8060 
ENV TODOS_API_ADDRESS=http://127.0.0.1:8019

RUN apt update

# Instala python 2
RUN apt install -y python2

#Instala nodejs (incluye vue)
RUN apt install -y nodejs

# Instala npm
RUN apt install -y npm

# Instalar las dependencias del proyecto
RUN npm install

# Copiar los archivos y carpetas del proyecto al directorio de 
# trabajo actual (la carpeta application creada con WORKDIR)
COPY . .

# Construye la aplicacion
RUN npm build

EXPOSE 8080

CMD [ "npm", "start" ]
