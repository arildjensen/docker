#!/bin/bash

iname=mysql_i1
datadir=/data/${iname}/mysql

# Make sure we have a local data directory for MySQL files.
if [ -d ${datadir} ]; then
  mkdir -p ${datadir}
fi

docker run \
  --name ${iname} \
  -p 0.0.0.0:3306:3306 \
  -v /root/.ssh:/root/.ssh:ro \
  -d \
  -t \
  -i \
  mysql

docker inspect ${iname} | grep IPAddress | awk -F\" '{print $4}'
