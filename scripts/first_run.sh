#!/usr/bin/env bash
#CB_USER=${CB_USER:desmond}
CB_USER=$CB_USER
CB_PASSWORD=${CB_PASSWORD:secret_password}
CB_RAMSIZE=${CB_RAMSIZE:-1024}
CB_BUCKET=${CB_BUCKET:-sync_gateway}
CB_BUCKET_FLUSH=${CB_BUCKET_FLUSH:-1}

post_start_action() {
  echo "**** POST START > Create User: $CB_USER"

  couchbase-cli cluster-init \
    -c 127.0.0.1:8091  \
    --cluster-username=$CB_USER \
    --cluster-password=$CB_PASSWORD \
    --cluster-ramsize=$CB_RAMSIZE \
    --cluster-index-ramsize=$CB_RAMSIZE \
    --services=data,index,query

  echo "**** POST START > Create Bucket: $CB_BUCKET"

  couchbase-cli bucket-create -c 127.0.0.1:8091 -u $CB_USER -p $CB_PASSWORD \
    --bucket=$CB_BUCKET \
    --bucket-type=couchbase \
    --bucket-ramsize=200 \
    --bucket-replica=0
    --enable-flush=$CB_BUCKET_FLUSH
    #--bucket-port=$CB_BUCKET_PORT \

    rm  /firstrun

    echo '**** POST START > FINISHED INIT < ****'
}