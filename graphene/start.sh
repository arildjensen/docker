#!/bin/sh

docker run -p 8080:8080 \
           -p 2003:2003 \
           -p 2004:2004 \
           -p 7002:7002 \
           -p 25826:25826/udp \
           -i \
           -t \
           -v /root/.ssh:/root/.ssh:ro \
           lopter/collectd-graphite
