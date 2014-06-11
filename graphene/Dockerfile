FROM ubuntu:14.04
MAINTAINER Arild Jensen <ajensen@counter-attack.com>

RUN apt-get update
RUN apt-get -y install graphite-web openssh-server
RUN echo "SECRET_KEY = '`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`'" >> /etc/graphite/local_settings.py

RUN /usr/bin/graphite-manage syncdb --noinput
RUN mkadmin.py 
