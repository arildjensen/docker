#!/bin/sh

image_name=$(pwd | xargs basename)
key_dir=/var/docker/${image_name}

if [ ! -d ${key_dir} ]; then
  mkdir -p  ${key_dir}
  chmod 700 ${key_dir}
  cp /root/.ssh/authorized_keys ${key_dir}
  chmod 600 ${key_dir}/*
fi 

docker run -p 9200:9200 \
           -p 9300:9300 \
           -i \
           -t \
           -d \
           -v ${key_dir}:/root/.ssh:ro \
           -h ${image_name} \
           --name=${image_name} \
           ${image_name} > $$.id

docker inspect $(cat $$.id) | grep IPAddress | awk -F\" '{print $4}' > $$.ip
ssh-keygen -f $HOME/.ssh/known_hosts -R 172.17.0.2 > /dev/null 2>&1

echo -n $(cat $$.ip)
echo -n " "
echo -n ${image_name}
echo -n " "
echo    $(cat $$.id)

rm $$.*
