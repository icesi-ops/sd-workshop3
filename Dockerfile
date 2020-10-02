FROM alpine:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apk --no-cache update 
RUN apk add --no-cache apache2
RUN apk add --no-cache wget
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf
WORKDIR /var/www/localhost/htdocs
RUN rm index.html
RUN wget -O index.html www.icesi.edu.co
EXPOSE 80
CMD ["-D","FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
