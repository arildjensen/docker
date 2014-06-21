#!/bin/sh

docker run -p 80:80 \
           -p 9292:9292 \
           -p 514:514 \
           -p 514:514/udp \
           -i \
           -t \
           -d \
           -v /root/.ssh:/root/.ssh:ro \
           logstash
