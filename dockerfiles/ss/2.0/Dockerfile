FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y git build-essential autoconf libtool libssl-dev \
    gawk debhelper dh-systemd init-system-helpers pkg-config asciidoc xmlto apg libpcre3-dev zlib1g-dev \
    libev-dev libudns-dev libsodium-dev

RUN git clone https://github.com/shadowsocks/shadowsocks-libev.git
RUN cd shadowsocks-libev
RUN ./autogen.sh && dpkg-buildpackage -b -us -uc -i
RUN cd ..
RUN dpkg -i shadowsocks-libev*.deb

EXPOSE 8388

COPY entrypoint.sh entrypoint.sh
COPY ss.json ss.json

ENTRYPOINT ["./entrypoint.sh"]
