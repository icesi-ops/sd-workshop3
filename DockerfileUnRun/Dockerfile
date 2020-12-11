FROM alpine:latest
MAINTAINER marcela.hormaza@correo.icesi.edu.co

ENV DEBIAN_FORNTEND=noninteractive
RUN apk --no-cache update && apk add --no-cache apache2 && apk add --no-cache wget && echo "ServerName localhost" >> /etc/apache2/apache2.conf
WORKDIR /var/www/localhost/htdocs
RUN mkdir /var/www/copia/ && mv index.html /var/www/copia/ && wget -O index.html www.icesi.edu.co
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
