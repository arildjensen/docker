FROM ubuntu:14.04
MAINTAINER Arild Jensen <ajensen@counter-attack.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RuN apt-get -y upgrade
RUN apt-get install -y curl default-jre-headless openssh-server supervisor

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN curl -L -o /tmp/funambol.tar.gz http://downloads.sourceforge.net/project/funambol/bundle/v10/funambol-10.0.3-x64.tgz
RUN tar zxf    /tmp/funambol.tar.gz -C /opt
RUN rm         /tmp/funambol.tar.gz

CMD ["/usr/bin/supervisord"]
EXPOSE 22 8080

################################################################################
# To run, execute:
# docker run --name funambol_i1 -p 0.0.0.0:8080:8080 -d -t -i funambol /bin/bash
################################################################################
