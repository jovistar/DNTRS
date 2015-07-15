#!/bin/sh

docker stop ss
docker rm ss

docker run -d --name ss -p 8388:8388 jovistar/ss

exit 0