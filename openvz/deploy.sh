#!/bin/sh

wget -O- http://shadowsocks.org/debian/1D27208A.gpg | sudo apt-key add -
echo "deb http://shadowsocks.org/debian wheezy main" >> /etc/apt/sources.list

apt-get update
apt-get install -y shadowsocks-libev

#ss
mv ss.json /root
ss-server -c /root/ss.json &

exit 0