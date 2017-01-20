FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y git build-essential autoconf libtool libssl-dev

RUN git clone https://github.com/shadowsocks/shadowsocks-libev.git
RUN cd shadowsocks-libev
RUN ./configure && make
RUN make install

EXPOSE 8388

COPY entrypoint.sh entrypoint.sh
COPY ss.json ss.json

ENTRYPOINT ["./entrypoint.sh"]
