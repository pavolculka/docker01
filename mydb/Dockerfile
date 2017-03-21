FROM debian:jessie
MAINTAINER Pavol Culka

# Install packages
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get upgrade -y && \
    apt-get -y update && \
    apt-get -y install mysql-server vim

RUN apt-get clean

# Add image configuration and scripts
ADD my.cnf /etc/mysql/my.cnf



COPY run.sh /run.sh
RUN chmod +x /run.sh

# Add volumes for MySQL 
VOLUME  /var/lib/mysql

EXPOSE 3306
CMD /run.sh
