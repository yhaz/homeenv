ip link add name vxlan0 type vxlan id 42 group 239.1.1.1 dev eth1
ip addr add 192.168.3.46/24 dev vxlan0
ip -6  addr add 2001::3:46/120 dev vxlan0
ifconfig vxlan0 up
ethtool -K vxlan0 gro off
