FROM ubuntu:14.04
MAINTAINER Arild Jensen <ajensen@counter-attack.com>

RUN apt-get update
RUN apt-get -y install graphite-web openssh-server supervisord

RUN echo "SECRET_KEY = '`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`'" >> /etc/graphite/local_settings.py
ADD scripts/mkadmin.py /usr/bin/mkadmin.py

RUN /usr/bin/graphite-manage syncdb --noinput
RUN /usr/bin/mkadmin.py 

CMD ["/usr/bin/supervisord"]

# SSH
EXPOSE :22

# Nginx
EXPOSE :80

# Carbon line receiver port
EXPOSE :2003

# Carbon pickle receiver port
EXPOSE :2004

# Carbon cache query port
EXPOSE :7002
