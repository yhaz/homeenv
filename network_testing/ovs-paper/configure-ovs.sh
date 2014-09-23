# perf server 126
ovs-vsctl add-br br0
ovs-vsctl set-fail-mode br0 secure

ovs-vsctl add-port br0 p2p1
ovs-vsctl add-port br0 p2p2

ovs-ofctl add-flow br0 "priority= 600, arp, action=normal"
ovs-ofctl add-flow br0 "priority= 500, ip, ip_dst=10.1.1.1, action=normal"

ovs-ofctl add-flow br0 "priority= 300, tcp, ip_dst=9.1.1.1, tcp_src=10, action=drop"
ovs-ofctl add-flow br0 "priority= 100, ip, ip_dst=9.1.1.1/255.255.255.0
, action=normal"
