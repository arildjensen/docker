FROM ubuntu:14.04
MAINTAINER Arild Jensen <ajensen@counter-attack.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y openssh-server
RUN apt-get install -y supervisor
RUN apt-get install -y curl 
RUN apt-get install -y default-jre-headless
RUN apt-get install -y nginx-light

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /opt/rundeck

RUN rm /etc/nginx/sites-enabled/default
ADD rundeck-nginx.conf /etc/nginx/sites-available/rundeck.conf
RUN ln -s /etc/nginx/sites-available/rundeck.conf /etc/nginx/sites-enabled/

RUN curl -L -o /opt/rundeck/rundeck-launcher-2.1.2.jar http://download.rundeck.org/jar/rundeck-launcher-2.1.2.jar

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
EXPOSE 22 80
