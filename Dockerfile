FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
MAINTAINER john.urbano@correo.icesi.edu.co

RUN apt update
RUN apt install -y apache2
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY . /var/www/html/
EXPOSE 80
RUN apt install -y wget
RUN apt install -y curl

WORKDIR /var/www/html/
RUN rm -f index.html
RUN wget www.icesi.edu.co

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
