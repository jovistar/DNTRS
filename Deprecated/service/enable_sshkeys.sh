#!/usr/bin/env bash

ssh-keygen -t rsa

mv /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config

echo "Please Download /root/.ssh/id_rsa to Your Local in 5 Minutes with SCP"
sleep 300

service ssh restart

exit 0