#!/bin/sh

apt-get update
apt-get install -y git apt-transport-https ca-certificates curl

git config --global user.email "jovistar@gmail.com"
git config --global user.name "jovistar"
git config --global push.default simple

curl -s http://yum.dockerproject.org/gpg | apt-key add
add-apt-repository "deb https://apt.dockerproject.org/repo/pool/$(lsb_release -cs) main"

apt-get update
apt-get install -y docker-engine

docker run hello-world

docker pull jovistar/ss
#docker pull jovistar/pdnsd
#docker pull jovistar/ocserv
#docker pull jovistar/ngrok
