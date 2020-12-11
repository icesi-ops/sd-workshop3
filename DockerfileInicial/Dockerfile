FROM alpine:latest
MAINTAINER marcela.hormaza@correo.icesi.edu.co

ENV DEBIAN_FORNTEND=noninteractive
RUN apk --no-cache update
RUN apk add --no-cache apache2
RUN apk add --no-cache wget
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
WORKDIR /var/www/localhost/htdocs
RUN mkdir /var/www/copia/
RUN mv index.html /var/www/copia/
RUN wget -O index.html www.icesi.edu.co
EXPOSE 80
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
