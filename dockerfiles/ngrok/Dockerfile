FROM ubuntu:14.04

RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y ngrok-server

EXPOSE 10000

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
