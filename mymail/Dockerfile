FROM debian:jessie
MAINTAINER Pavol Culka

# Install packages
ENV DEBIAN_FRONTEND noninteractive


RUN apt-get upgrade -y && \
    apt-get -y update && \
    apt-get -y install apache2 php5 postfix wget vim squirrelmail dovecot-core dovecot-imapd

RUN apt-get clean

ADD apache_default /etc/apache2/sites-available/000-default.conf

ADD main.cf /etc/postfix/main.cf

#RUN useradd test
#RUN echo "test:test" | chpasswd
#RUN echo test | passwd test --stdin

ADD config.php /etc/squirrelmail/config.php

#ADD create_user.sh /create_user.sh
#RUN chmod +x /create_user.sh
#RUN /create_user.sh

ADD run.sh /run.sh
RUN chmod +x /run.sh



EXPOSE 25 80 

CMD /run.sh
