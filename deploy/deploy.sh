#!/bin/sh

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
bash -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

apt-get update
apt-get install -y git lxc-docker apt-transport-https

docker pull jovistar/ss
docker pull jovistar/pdnsd

git config --global user.email "jovistar@gmail.com"
git config --global user.name "jovistar"
git config --global push.default simple