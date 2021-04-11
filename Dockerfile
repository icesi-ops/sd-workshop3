FROM ubuntu:latest
MAINTAINER jaimecardona364@gmail.com

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y
RUN apt install -y apache2
RUN apt install wget
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf
WORKDIR /var/www/html

RUN rm index.html
RUN wget www.icesi.edu.co

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
