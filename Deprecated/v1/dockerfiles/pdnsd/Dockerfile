FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y wget vim

RUN apt-get install -y pdnsd

EXPOSE 2323 2323/udp

COPY pdnsd.conf /etc/pdnsd.conf