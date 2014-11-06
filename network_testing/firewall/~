ovs-vsctl set-fail-mode br0 secure
ovs-ofctl add-flow br0 \
        "in_port=local,conn_state=0x00/0x80,ip,action=conntrack(zone=0),normal"
ovs-ofctl add-flow br0 \
        "in_port=1,conn_state=0x00/0x80,ip,action=conntrack(flags=1,zone=0)"
ovs-ofctl add-flow br0 in_port=1,conn_state=0x82/0x83,ip,action=local
ovs-ofctl add-flow br0 in_port=1,conn_state=0x81/0x83,ip,action=drop
ovs-ofctl add-flow br0 priority=10,action=normal

