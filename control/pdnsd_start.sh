#!/bin/sh

docker stop pdnsd
docker rm pdnsd

docker run -d -p 2323:2323 -p 2323:2323/udp -P --name pdnsd jovistar/pdnsd /usr/sbin/pdnsd

exit 0