FROM debian:jessie
MAINTAINER Pavol Culka

# Install packages
ENV DEBIAN_FRONTEND noninteractive

#Environment variables to configure php
ENV PHP_UPLOAD_MAX_FILESIZE 10M
ENV PHP_POST_MAX_SIZE 10M


RUN apt-get upgrade -y && \
    apt-get -y update && \
    apt-get -y install git apache2 wget vim

RUN wget -qO - http://www.dotdeb.org/dotdeb.gpg | apt-key add - 
ADD dotdeb.list /etc/apt/sources.list.d/dotdeb.list

RUN apt-get -y update
RUN apt-get -y install libapache2-mod-php7.0 php7.0 php7.0-apcu php7.0-apcu-bc php7.0-bcmath php7.0-cli php7.0-common \
	    php7.0-fpm php7.0-json php7.0-mbstring php7.0-mysql php7.0-opcache php7.0-readline php7.0-xml

RUN apt-get clean

# config to enable .htaccess
ADD apache_default /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite


RUN sed -ri -e "s/^upload_max_filesize.*/upload_max_filesize = ${PHP_UPLOAD_MAX_FILESIZE}/" \
        -e "s/^post_max_size.*/post_max_size = ${PHP_POST_MAX_SIZE}/" /etc/php/7.0/apache2/php.ini


VOLUME  /var/www/html

EXPOSE 80 
#CMD source /etc/apache2/envvars
#CMD apache2 -D FOREGROUND
CMD exec apache2ctl -DFOREGROUND
