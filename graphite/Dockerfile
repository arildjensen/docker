FROM ubuntu:14.04
MAINTAINER Arild Jensen <ajensen@counter-attack.com>

RUN apt-get update
RUN apt-get -y install supervisor
RUN apt-get -y install openssh-server 
RUN apt-get -y install graphite-web 
RUN apt-get -y install graphite-carbon
RUN apt-get -y install apache2
RUN apt-get -y install libapache2-mod-wsgi

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor
RUN rm /etc/apache2/sites-enabled/000-default.conf
RUN ln -s /usr/share/graphite-web/apache2-graphite.conf /etc/apache2/sites-enabled/

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN echo "CARBON_CACHE_ENABLED=true" > /etc/default/graphite-carbon
RUN echo "SECRET_KEY = '`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`'" >> /etc/graphite/local_settings.py
RUN echo "DATABASES = { 'default': { 'NAME': '/var/lib/graphite/graphite.db', 'ENGINE': 'django.db.backends.sqlite3', 'USER': 'admin', 'PASSWORD': 'graphite', 'HOST': '', 'PORT': '' } }" >> /etc/graphite.local_settings.py
ADD scripts/mkadmin.py /usr/bin/mkadmin.py
RUN chmod 755          /usr/bin/mkadmin.py

RUN /usr/bin/graphite-manage syncdb --noinput
RUN /usr/bin/mkadmin.py 
RUN chmod 666 /var/lib/graphite/graphite.db

CMD ["/usr/bin/supervisord"]

# SSH
EXPOSE 22

# Nginx
EXPOSE 80

# Carbon line receiver port
EXPOSE 2003

# Carbon pickle receiver port
EXPOSE 2004

# Carbon cache query port
EXPOSE 7002
