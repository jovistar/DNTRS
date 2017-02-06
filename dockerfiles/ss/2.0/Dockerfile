FROM ubuntu:16.04

RUN apt-get update

COPY ss.deb ss.deb
RUN dpkg -i ss.deb; exit 0

RUN apt-get -f -y install
RUN dpkg -i ss.deb

EXPOSE 8388

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
COPY ss.json ss.json

ENTRYPOINT ["./entrypoint.sh"]
