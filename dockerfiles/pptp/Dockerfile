FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y pptpd iptables

RUN echo "localip 192.168.233.1" >> /etc/pptpd.conf
RUN echo "remoteip 192.168.233.100-200" >> /etc/pptpd.conf
RUN echo "ms-dns 8.8.8.8" >> /etc/ppp/pptpd-options
RUN echo "ms-dns 8.8.4.4" >> /etc/ppp/pptpd-options
RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
RUN sysctl -p

EXPOSE 1723

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]