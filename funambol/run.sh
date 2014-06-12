#!/bin/bash

docker run \
  --name funambol_i1 \
  -p 0.0.0.0:8080:8080 \
  -d \
  -t \
  -i \
  funambol \
  /bin/bash
