NETNS=mt
NETNS2=mt2
DEV=veth-$NETNS
DEV2=veth-$NETNS2
NETNS_IP=10.0.0.1/24
NETNS2_IP=10.0.0.2/24

configure_netns()
{
    ip netns add $NETNS
    ip link add dev $DEV type veth peer name veth0 netns $NETNS
    ip link set dev $DEV up
    ip netns exec $NETNS ip li set dev veth0 up
    ip netns exec $NETNS ip addr add dev veth0 $NETNS_IP

    ip netns add $NETNS2
    ip link add dev $DEV2 type veth peer name veth0 netns $NETNS2
    ip link set dev $DEV2 up
    ip netns exec $NETNS2 ip li set dev veth0 up
    ip netns exec $NETNS2 ip addr add dev veth0 $NETNS2_IP
}

configure_ovs()
{
    ovs-vsctl add-br br0
    ovs-vsctl add-port br0 veth-mt -- set interface veth-mt ofport_request=101
    ovs-vsctl add-port br0 veth-mt2 -- set interface veth-mt2 ofport_request=102

    ovs-vsctl set-fail-mode br0 secure
    ovs-vsctl show

    ovs-ofctl -O OpenFlow13 add-meter br0 'meter=1 pktps burst stats bands=type=drop rate=3 burst_size=3'
    ovs-ofctl -O OpenFlow13 dump-meters br0

    ovs-ofctl add-flow br0 'priority=1, action=normal'
    ovs-ofctl -O OpenFlow13 add-flow br0 'priority=100,in_port=102,action=101'
    ovs-ofctl -O OpenFlow13 add-flow br0 'priority=200,in_port=101,action=meter:1,102'
    ovs-ofctl -O OpenFlow13 add-flow br0 'priority=300,arp,action=normal'

    ovs-ofctl dump-flows br0
}


cleanup()
{
    ovs-vsctl del-br br0
    ip link set dev veth-${NETNS} down
    ip link del dev veth-${NETNS}
    ip netns del ${NETNS}
    ip link set dev veth-${NETNS2} down
    ip link del dev veth-${NETNS2}
    ip netns del ${NETNS2}
}

run()
{
    configure_netns
    configure_ovs
    trap cleanup SIGINT SIGTERM
    echo "Run your test now..."
    read -n 1
    cleanup
    exit 0
}

run
