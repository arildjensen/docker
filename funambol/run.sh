#!/bin/bash

iname=funambol_i1

docker run \
  --name ${iname} \
  -p 0.0.0.0:8080:8080 \
  -v /root/.ssh:/root/.ssh:ro \
  -d \
  -t \
  -i \
  funambol

docker inspect ${iname} | grep IPAddress | awk -F\" '{print $4}'
