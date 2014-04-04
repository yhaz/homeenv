ip netns delete red
ip netns delete blue
ovs-vsctl del-br br0

ip netns add red
ip netns add blue

ovs-vsctl add-br br0
ovs-ofctl add-flow br0 action=normal
ovs-vsctl add-port br0 p0 -- set interface p0 type=internal
ovs-vsctl add-port br0 p1 -- set interface p1 type=internal
ip link set p0 netns red
ip link set p1 netns blue

ip netns exec blue ifconfig p1 2.2.2.2/24 up 
ip netns exec red ifconfig p0 2.2.2.1/24 up 
