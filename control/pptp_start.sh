#!/bin/sh

echo "jovistar * lijinghua1 *" > /chap-secrets
docker run --name pptp -d -p 1723:1723 -v /chap-secrets:/etc/ppp/chap-secrets:ro jovistar/pptp