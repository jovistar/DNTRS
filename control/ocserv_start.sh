#/bin/sh

docker run --name ocserv --privileged -p 443:443 -p 443:443/udp -e CA_CN="JSCLOUD CA" -e CA_ORG="JSCLOUD" -e CA_DAYS=3650 -e SRV_CN=jscloud.in -e SRV_ORG="JSCLOUD" -e SRV_DAYS=365 -d tommylau/ocserv
sleep 5

docker exec -ti ocserv ocpasswd -c /etc/ocserv/ocpasswd jovistar
docker exec -ti ocserv ocpasswd -c /etc/ocserv/ocpasswd -d test

exit 0