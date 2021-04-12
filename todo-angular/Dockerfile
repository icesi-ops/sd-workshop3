FROM node:10-alpine as build-step
COPY . /app
WORKDIR app
RUN npm install && npm uninstall node-sass && npm install node-sass@4.14.1 && npm run build --prod
FROM nginx:1.17.1-alpine
COPY --from=build-step /app/dist/todo-app /usr/share/nginx/html

