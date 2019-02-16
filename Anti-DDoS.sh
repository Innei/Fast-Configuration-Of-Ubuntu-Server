echo "net.ipv4.tcp_max_syn_backlog = 4096 "  >> /etc/sysctl.conf
echo "net.ipv4.tcp_syncookies = 1         "  >> /etc/sysctl.conf
echo "net.ipv4.tcp_synack_retries = 2     "  >> /etc/sysctl.conf
echo "net.ipv4.tcp_syn_retries = 2        "  >> /etc/sysctl.conf
echo "net.ipv4.tcp_rmem = 32768"             >> /etc/sysctl.conf
echo "net.ipv4.tcp_wmem = 32768"             >> /etc/sysctl.conf
echo "net.ipv4.tcp_sack = 0    "             >> /etc/sysctl.conf
sysctl -p 
iptables -A INPUT -i eth0 -m limit --limit 1/sec --limit-burst 5 -j ACCEPT
iptables -A FORWARD -p tcp --syn -m limit --limit 1/s -j ACCEPT
iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
iptables -I INPUT -p tcp --dport 80 -m connlimit --connlimit-above 30 -j REJECT
iptables -A INPUT -p tcp --dport 80 -m recent --name BAD_HTTP_ACCESS --update --seconds 60 --hitcount 30 -j REJECT
iptables -A INPUT -p tcp --dport 80 -m recent --name BAD_HTTP_ACCESS --set -j ACCEPT

# install DDoS deflate
curl http://www.inetbase.com/scripts/ddos/install.sh | sh
