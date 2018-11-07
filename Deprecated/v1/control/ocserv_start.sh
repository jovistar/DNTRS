#!/usr/bin/env bash

docker stop ocserv
docker rm ocserv

docker run --restart always --name ocserv --privileged -p 30443:443 -p 30443:443/udp -e CA_CN="JSCLOUD CA" -e CA_ORG="JSCLOUD" -e CA_DAYS=3650 -e SRV_CN=jscloud.in -e SRV_ORG="JSCLOUD" -e SRV_DAYS=365 -d jovistar/ocserv
sleep 2

docker exec -ti ocserv ocpasswd -c /etc/ocserv/ocpasswd jovistar
docker exec -ti ocserv ocpasswd -c /etc/ocserv/ocpasswd -d test

exit 0
