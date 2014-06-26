FROM ubuntu:14.04
MAINTAINER Arild Jensen <ajensen@counter-attack.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y openssh-server
RUN apt-get install -y supervisor
RUN apt-get install -y tomcat6-admin tomcat6

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /opt/rundeck

ADD tomcat-users.xml   /etc/tomcat6/tomcat-users.xml
RUN chown root.tomcat6 /etc/tomcat6/tomcat-users.xml
RUN chmod 0640         /etc/tomcat6/tomcat-users.xml

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
EXPOSE 22 8080
