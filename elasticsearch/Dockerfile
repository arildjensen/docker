FROM ubuntu:14.04
MAINTAINER Arild Jensen <ajensen@counter-attack.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y supervisor
RUN apt-get install -y openssh-server 
RUN apt-get install -y curl
RUN apt-get install -y default-jre-headless

RUN curl http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb http://packages.elasticsearch.org/elasticsearch/1.2/debian stable main" >> /etc/apt/sources.list
RUN echo "deb http://packages.elasticsearch.org/logstash/1.2/debian stable main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y elasticsearch

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
EXPOSE 22 9200 9300
