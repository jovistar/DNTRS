#!/bin/sh

echo "jovistar * lijinghua1 *" > /chap-secrets

docker run -d --name pptp --privileged -p 1723:1723 -v /chap-secrets:/etc/ppp/chap-secrets jovistar/pptp