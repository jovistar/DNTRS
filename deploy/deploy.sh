#!/bin/sh

apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
bash -c "echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list"

apt-get update
apt-get install -y git docker-engine apt-transport-https ca-certificates

docker pull jovistar/ss
docker pull jovistar/pdnsd
docker pull jovistar/ocserv
docker pull jovistar/ngrok

git config --global user.email "jovistar@gmail.com"
git config --global user.name "jovistar"
git config --global push.default simple
