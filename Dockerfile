FROM alpine:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apk upgrade
RUN apk add apache2
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN apk add wget

RUN rm /var/www/localhost/htdocs/index.html
WORKDIR /var/www/localhost/htdocs
RUN wget -O index.html www.icesi.edu.co

EXPOSE 80

CMD ["-D","FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
