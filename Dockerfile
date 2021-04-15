FROM node:14-alpine as build
RUN apk update
RUN apk add git
WORKDIR /app
COPY ./todo-angular .
RUN npm install
RUN npm run-script build
ENTRYPOINT ["tail", "-f", "/dev/null"]
FROM nginx:1.17-alpine 
EXPOSE 80
COPY --from=build /app/dist/todo-app /usr/share/nginx/html
CMD ["-g", "daemon off;"]
ENTRYPOINT [ "nginx" ]