#!/bin/sh

wget -O- http://shadowsocks.org/debian/1D27208A.gpg | sudo apt-key add -
echo "deb http://shadowsocks.org/debian wheezy main" >> /etc/apt/sources.list

apt-get update
apt-get install -y shadowsocks-libev pdnsd pptpd

#pdnsd
mv pdnsd.conf /etc/pdnsd.conf
mv pdnsd /etc/default/pdnsd
service pdnsd start

#ss
mv ss.json /root
ss-server -c /root/ss.json

exit 0