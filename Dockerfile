FROM alpine:latest
MAINTAINER jeferson.lerma@correo.icesi.edu.co

RUN apk update &&  apk upgrade && apk add apache2 &&  apk add openrc 


EXPOSE 80 443
WORKDIR /var/www/localhost/htdocs
RUN rm index.html 
RUN wget www.icesi.edu.co


CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
