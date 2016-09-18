#!/bin/sh

docker stop ngrok
docker rm ngrok

docker run --restart always -d --name ngrok -p 10000:10000 -p 38387:38387 jovistar/ngrok

exit 0
