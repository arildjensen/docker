FROM ubuntu:14.04
MAINTAINER Arild Jensen <ajensen@counter-attack.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y supervisor
RUN apt-get install -y openssh-server 
RUN apt-get install -y curl
RUN apt-get install -y default-jre-headless 
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN curl -L -O https://download.elasticsearch.org/logstash/logstash/logstash-1.4.1.tar.gz
RUN curl -L -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.1.tar.gz
RUN tar zxf logstash-1.4.1.tar.gz      -C /opt
RUN tar zxf elasticsearch-1.2.1.tar.gz -C /opt
RUN rm      logstash-1.4.1.tar.gz
RUN rm      elasticsearch-1.2.1.tar.gz
ADD logstash.conf /opt/logstash-1.4.1/logstash.conf

CMD ["/usr/bin/supervisord"]
EXPOSE 22 514/tcp 514/udp 9292
