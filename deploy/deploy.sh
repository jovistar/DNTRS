#!/bin/sh

apt-get update
apt-get install -y git apt-transport-https ca-certificates curl software-properties-common

git config --global user.email "jovistar@gmail.com"
git config --global user.name "jovistar"
git config --global push.default simple

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt-get update
apt-get install -y docker-ce

docker pull jovistar/ss
#docker pull jovistar/pdnsd
#docker pull jovistar/ocserv
#docker pull jovistar/ngrok
