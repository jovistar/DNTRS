#!/bin/sh

echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

sysctl -p

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
pptpd -f