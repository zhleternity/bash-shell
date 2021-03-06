#!/bin/bash

SYSCTL_CONF=/etc/sysctl.conf ;

sed -i "/net.core.default_qdisc/d" "$SYSCTL_CONF";
sed -i "/net.ipv4.tcp_congestion_control/d" "$SYSCTL_CONF";

echo "net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr" >> "$SYSCTL_CONF";

sysctl -p $SYSCTL_CONF ;

# cat /proc/sys/net/ipv4/tcp_congestion_control
# cat /proc/sys/net/core/default_qdisc