
# sudo ip tuntap add dev tap0 mode tap user azhou

#ADDED=-net nic,vlan=0,model=e1000,macaddr=52:54:00:00:00:01 -net tap,vlan=0,ifname=tap0,script=no,downscript=no

ADDED=-net nic -net user -device e1000,netdev=network0,mac=52:54:00:00:00:01 -netdev tap,id=network0,ifname=tap0,script=no,downscript=no -nographic

include ../make.base

