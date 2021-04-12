FROM node:14-alpine as angular
COPY . .
RUN npm --verbose install
RUN npm build
FROM nginx:1.17.1-alpine 
COPY --from=angular ./src/index.html /usr/share/nginx/html
ENTRYPOINT ["nginx", "-g", "daemon off;"]
