#!/bin/sh

CONTAINER_NAME="v2ray"

docker stop "$CONTAINTER_NAME"
docker rm "$CONTAINER_NAME"

exit 0