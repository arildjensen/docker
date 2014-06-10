FROM ubuntu:14.04
MAINTAINER Arild Jensen <ajensen@counter-attack.com>

RUN apt-get update
RUN echo "mysql-server mysql-server/root_password password       root" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
RUN apt-get install -y drupal7 openssh-server mysql-server

EXPOSE 3306

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

