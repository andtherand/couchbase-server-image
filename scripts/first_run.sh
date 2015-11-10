#!/usr/bin/env bash

couchbase-cli cluster-init \
  -c 127.0.0.1 \
  --cluster-username=$CB_USER \
  --cluster-password=$CB_PASSWORD \
  --cluster-ramsize=$CB_RAMSIZE \
  --cluser-port=$CB_PORT
  --services=data,index,query \

rm -rf /firstrun