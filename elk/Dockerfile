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

RUN curl -L -O https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash_1.4.2-1-2c0f5a1_all.deb
RUN curl -L -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.1.deb
RUN dpkg -i logstash_1.4.2-1-2c0f5a1_all.deb
RUN dpkg -i elasticsearch-1.2.1.deb
RUN rm      logstash_1.4.2-1-2c0f5a1_all.deb
RUN rm      elasticsearch-1.2.1.deb

#ADD logstash.conf /etc/logstash/conf.d/logstash.conf

CMD ["/usr/bin/supervisord"]
EXPOSE 22 514/tcp 514/udp 9200 9292 9300
