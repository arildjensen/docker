#!/bin/sh

docker run -p 80:80 \
           -p 2003:2003 \
           -p 2004:2004 \
           -p 7002:7002 \
           -i \
           -t \
           -d \
           -v /root/.ssh:/root/.ssh:ro \
           graphene
