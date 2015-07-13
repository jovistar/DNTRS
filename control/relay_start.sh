#!/bin/sh

docker run -d --name relay -v relay.cfg:/usr/local/etc/haproxy/haproxy.cfg:ro haproxy

exit 0