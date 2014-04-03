
source ~/bin/ovs_bash_lib.sh

BRIDGE=br0
BOND=bond0
BOND_PORTS='eth1 eth2 eth3'

ovs_add_bridge $BRIDGE
ovs_add_flow $BRIDGE 'action=normal'
ovs_add_bond $BRIDGE $BOND $BOND_PORTS

ovs-vsctl show
