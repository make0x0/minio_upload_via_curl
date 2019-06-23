#!/bin/bash

# sh minio_upload.sh default CentOS-7-x86_64-DVD-1810.iso

bucket=$1
file=$2

# change your server and keys
host="192.168.11.10:9000"
access_key='minioaccess'
secret_key='miniosecret'
serverhttp="http"

resource="/${bucket}/${file}"
content_type="application/octet-stream"
date=`date -R`
_signature="PUT\n\n${content_type}\n${date}\n${resource}"
signature=`echo -en ${_signature} | openssl sha1 -hmac ${secret_key} -binary | base64`

curl -v -X PUT -T "${file}" \
          -H "Host: $host" \
          -H "Date: ${date}" \
          -H "Content-Type: ${content_type}" \
          -H "Authorization: AWS ${access_key}:${signature}" \
          $serverhttp://$host${resource}
