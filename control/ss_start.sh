#!/bin/sh

docker stop ss
docker rm ss

docker run --restart always -d --name ss -p 38388:8388 jovistar/ss

exit 0
