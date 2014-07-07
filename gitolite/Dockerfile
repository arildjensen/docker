FROM ubuntu:14.04
MAINTAINER Arild Jensen <ajensen@counter-attack.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y supervisor
RUN apt-get install -y openssh-server 
RUN apt-get install -y git
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

RUN adduser --system --group --shell /bin/sh git
RUN su git -c "mkdir /home/git/bin"

ADD admin.pub /home/git/admin.pub

RUN cd /home/git; su git -c "git clone git://github.com/sitaramc/gitolite";
RUN cd /home/git; su git -c "gitolite/install -ln";
RUN cd /home/git; su git -c "bin/gitolite setup -pk admin.pub"

CMD ["/usr/bin/supervisord"]
EXPOSE 22
