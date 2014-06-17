#!/bin/bash

iname=rundeck_1

docker run \
  --name ${iname} \
  -p 0.0.0.0:4440:4440 \
  -v /root/.ssh:/root/.ssh:ro \
  -d \
  -t \
  -i \
  rundeck 

docker inspect ${iname} | grep IPAddress | awk -F\" '{print $4}'
