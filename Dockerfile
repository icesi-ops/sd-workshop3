FROM alpine:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apk update
RUN apk add apache2
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY . /var/www/html/
EXPOSE 80
RUN apk add wget
WORKDIR /var/www/localhost/htdocs/
RUN wget -O index.html www.icesi.edu.co

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"] 
