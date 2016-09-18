#!/bin/sh

ngrokd -domain="n2n.jscloud.in" -tunnelAddr=":10000" -log=/var/log/ngrok.log
