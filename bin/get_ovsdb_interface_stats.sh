#
# Usage get_ovsdb_interface_stats.sh <interface name.

ovs-vsctl list interface $1 |grep statistics |tr , '\n' |grep rx_packets > /tmp/t1
cat /tmp/t1 |sed s/.*rx_packets=//g > /tmp/t2
cat /tmp/t2

