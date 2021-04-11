#Preparation step (building)
FROM node:latest as node
WORKDIR /app
#Copia toda la app al folder app
COPY . .
RUN npm install
#Tiene problemas con al v5.0.0. asi que toca desinstalar e instalar el 4.19.1
RUN npm install -g npm@7.9.0
RUN npm uninstall node-sass
RUN npm install node-sass@4.14.1
RUN npm run build --prod
#Production step
FROM nginx:alpine
COPY --from=node /app/dist/todo-app /usr/share/nginx/html
