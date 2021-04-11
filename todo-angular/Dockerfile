FROM node:10-alpine as build-step
COPY . /app
RUN cd /app && npm install && npm run build --prod
FROM nginx:1.17.1-alpine
COPY --from=build-step /app/dist/todo-app /usr/share/nginx/html
