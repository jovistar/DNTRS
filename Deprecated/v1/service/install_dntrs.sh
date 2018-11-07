#!/usr/bin/env bash

apt-get update
apt-get upgrade -y

apt-get install -y git
mkdir /root/git
cd /root/git
git clone https://github.com/jovistar/DNTRS.git
cd DNTRS/deploy
./deploy.sh

cd ../control
./start.sh

exit 0