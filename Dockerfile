FROM node:10-alpine as angular-todo-app
COPY . /app
RUN sh /app/build.sh
FROM nginx:1.17.1-alpine
COPY --from=angular-todo-app /app/dist/todo-app /usr/share/nginx/html

