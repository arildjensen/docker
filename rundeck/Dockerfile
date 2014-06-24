FROM ubuntu:14.04
MAINTAINER Arild Jensen <ajensen@counter-attack.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
#RUN apt-get install -y openssh-server supervisor curl default-jre-headless
RUN apt-get install -y openssh-server
RUN apt-get install -y supervisor
RUN apt-get install -y curl 
RUN apt-get install -y default-jre-headless

# Ugly hack until Ubunto fixes a mistake in their packaging. By default it tries to use the non-existent 2014c package :(
#RUN curl -L -O http://archive.ubuntu.com/ubuntu/pool/main/t/tzdata/tzdata_2014e-0ubuntu0.14.04_all.deb
#RUN curl -L -O http://archive.ubuntu.com/ubuntu/pool/main/t/tzdata/tzdata-java_2014e-0ubuntu0.14.04_all.deb 
#RUN dpkg -i tzdata_2014e-0ubuntu0.14.04_all.deb
#RUN dpkg -i tzdata-java_2014e-0ubuntu0.14.04_all.deb
#RUN rm tzdata*.deb


#RUN apt-get install -y openjdk-6-jre-headless
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /opt/rundeck

RUN curl -L -o /opt/rundeck/rundeck-launcher-2.1.2.jar http://download.rundeck.org/jar/rundeck-launcher-2.1.2.jar
ADD rundeck-start.sh /opt/rundeck/start.sh
ADD rundeck-setup.sh /opt/rundeck/setup.sh
RUN chmod 755        /opt/rundeck/start.sh
RUN chmod 755        /opt/rundeck/setup.sh

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
EXPOSE 22 4440
