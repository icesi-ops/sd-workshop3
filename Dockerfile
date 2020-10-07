FROM alpine:latest 
MAINTAINER jessica.sanchez1@correo.icesi.edu.co

ENV DEBIAN_FRONTEND=noninteractive
RUN apk update
RUN apk add apache2
RUN apk add wget
RUN echo "ServerName 127.0.0.1 >> /etc/apache2/apache2.conf"

WORKDIR /var/www/localhost/htdocs

RUN rm index.html
RUN wget -O index.html  www.icesi.edu.co
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
