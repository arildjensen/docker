#!/bin/bash

for i in $(docker ps -a | grep -v ^CONTAINER | awk '{print $1}'); do
  docker kill $i
  docker rm   $i
done

for i in $(docker images | grep -v ^REPOSITORY | grep -v ^ubuntu | awk '{print $3}'); do
  docker rmi $i
done
