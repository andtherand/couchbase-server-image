#!/usr/bin/env bash

couchbase-cli cluster-init \
  -c 127.0.0.1 \
  --cluster-username=$CB_USER \
  --cluster-password=$CB_PASSWORD \
  --cluster-ramsize=$CB_RAMSIZE \
  --cluser-port=$CB_PORT
  --services=data,index,query

couchbase-cli bucket-create -c 127.0.0.1:$CB_PORT -u $CB_USER -p $CB_PASSWORD
       --bucket=$CB_BUCKET
       --bucket-type=couchbase
       --bucket-port=11222
       --bucket-ramsize=200
       --bucket-replica=0

rm -rf /firstrun