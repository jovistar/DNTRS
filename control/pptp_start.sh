#!/bin/sh

echo "jovistar * lijinghua1 *" > /chap-secrets

docker run -d --privileged -p 1723:1723 -v /chap-secrets:/etc/ppp/chap-secrets jovistar/pptp