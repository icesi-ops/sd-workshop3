FROM alpine:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apk --no-cache upgrade && apk add --no-cache apache2 && echo "ServerName localhost" >> /etc/apache2/apache2.conf && apk add wget && rm /var/www/localhost/htdocs/index.html

WORKDIR /var/www/localhost/htdocs
RUN wget -O index.html www.icesi.edu.co

EXPOSE 80
CMD ["-D","FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]

