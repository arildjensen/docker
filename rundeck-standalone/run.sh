#!/bin/sh

image_name=$(pwd | xargs basename)
key_dir=/var/docker/${image_name}

if [ ! -d ${key_dir} ]; then
  mkdir -p  ${key_dir}
  chmod 700 ${key_dir}
  cp /root/.ssh/authorized_keys ${key_dir}
  chmod 600 ${key_dir}/*
fi 

docker run -p 80:80 \
           -i \
           -t \
           -d \
           -v ${key_dir}:/root/.ssh:ro \
           -h ${image_name} \
           --name=${image_name} \
           ${image_name}

docker inspect ${image_name} | grep IPAddress | awk -F\" '{print $4}'
