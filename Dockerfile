FROM node:10-alpine as builder
WORKDIR /workshop3/todo

COPY todo-angular .
RUN npm install
RUN npm run-script build 

FROM nginx:alpine
COPY --from=builder /workshop3/todo/dist/todo-app /usr/share/nginx/html
EXPOSE 80
CMD ["nginx","-g", "daemon off;"]