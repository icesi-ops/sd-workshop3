FROM alpine:latest
MAINTAINER john.urbano@correo.icesi.edu.co

RUN apk --no-cache upgrade
RUN apk add --no-cache apache2
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY . /var/www/html/
EXPOSE 80
RUN apk add --no-cache wget
WORKDIR /var/www/localhost/htdocs
RUN rm -f index.html
RUN wget www.icesi.edu.co


CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
