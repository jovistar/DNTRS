#!/bin/sh

iptables -t nat -F

sleep 5

remoteIp=$1
iface=$2

localIpArg=`ifconfig $iface |grep "inet addr"| cut -f 2 -d ":"|cut -f 1 -d " "`
localIp=$localIpArg


#dns
dnsLPort=32323
dnsRPort=2323
iptables -t nat -A PREROUTING -p udp --dport $dnsLPort -j DNAT --to-destination $remoteIp:$dnsRPort
iptables -t nat -A POSTROUTING -p udp -d $remoteIp --dport $dnsRPort -j SNAT --to-source $localIp
iptables -t nat -A PREROUTING -p tcp --dport $dnsLPort -j DNAT --to-destination $remoteIp:$dnsRPort
iptables -t nat -A POSTROUTING -p tcp -d $remoteIp --dport $dnsRPort -j SNAT --to-source $localIp

#ss
ssLPort=38388
ssRPort=8388
iptables -t nat -A PREROUTING -p tcp --dport $ssLPort -j DNAT --to-destination $remoteIp:$ssRPort
iptables -t nat -A POSTROUTING -p tcp -d $remoteIp --dport $ssRPort -j SNAT --to-source $localIp

#anyconnect(ac)
acLPort=30443
acRPort=443
iptables -t nat -A PREROUTING -p udp --dport $acLPort -j DNAT --to-destination $remoteIp:$acRPort
iptables -t nat -A POSTROUTING -p udp -d $remoteIp --dport $acRPort -j SNAT --to-source $localIp
iptables -t nat -A PREROUTING -p tcp --dport $acLPort -j DNAT --to-destination $remoteIp:$acRPort
iptables -t nat -A POSTROUTING -p tcp -d $remoteIp --dport $acRPort -j SNAT --to-source $localIp

#ssh
#sshLPort=2222
#sshRPort=22
#iptables -t nat -A PREROUTING -p tcp --dport $sshLPort -j DNAT --to-destination $remoteIp:$sshRPort
#iptables -t nat -A POSTROUTING -p tcp -d $remoteIp --dport $sshRPort -j SNAT --to-source $localIp

exit 0
