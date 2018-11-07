#!/bin/sh

CONTAINER_NAME="v2ray"

docker stop "$CONTAINTER_NAME"
docker rm "$CONTAINER_NAME"

docker run -d --name "$CONTAINER_NAME" --restart always -v `pwd`:/etc/v2ray -p 38388:38388 v2ray/official v2ray -config=/etc/v2ray/config.json

exit 0