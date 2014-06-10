FROM ubuntu:14.04
MAINTAINER Arild Jensen <ajensen@counter-attack.com>
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y default-jre-headless
RUN curl -L -o /tmp/funambol.tar.gz http://downloads.sourceforge.net/project/funambol/bundle/v10/funambol-10.0.3-x64.tgz
RUN tar zxf    /tmp/funambol.tar.gz -C /opt
RUN rm         /tmp/funambol.tar.gz
CMD /opt/Funambol/bin/funambol start
EXPOSE 8080
################################################################################
# To build, run:
# docker build -t funambol ~/github/home-lab/docker/funambol/
################################################################################
# To run, execute:
# docker run --name funambol_i1 -p 0.0.0.0:8080:8080 -d -t -i funambol /bin/bash
################################################################################
