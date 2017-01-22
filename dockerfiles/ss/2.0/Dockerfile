FROM ubuntu:16.04

RUN apt-get update

COPY ss.deb ss.deb
RUN dpkg -i ss.deb

RUN apt-get -f -y install
RUN dpkg - ss.deb

EXPOSE 8388

COPY entrypoint.sh entrypoint.sh
COPY ss.json ss.json

ENTRYPOINT ["./entrypoint.sh"]
