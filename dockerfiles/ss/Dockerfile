FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y wget vim

RUN wget -O- http://shadowsocks.org/debian/1D27208A.gpg | sudo apt-key add -
RUN echo "deb http://shadowsocks.org/debian wheezy main" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y shadowsocks-libev

EXPOSE 8388

COPY entrypoint.sh entrypoint.sh
COPY ss.json ss.json

ENTRYPOINT ["./entrypoint.sh"]