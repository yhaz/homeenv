ovs-vsctl set-fail-mode br0 secure
ovs-ofctl add-flow br0 \
        "in_port=local,ip,action=ip_defrag(zone=0),normal"
ovs-ofctl add-flow br0 \
        "in_port=1,ip,action=ip_defrag(zone=0),local"
ovs-ofctl add-flow br0 priority=10,action=normal

