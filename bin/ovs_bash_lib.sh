ECHO=

function enable_echo
{
   ECHO=echo
}

function ovs_add_bond
{
   bridge=$1
   shift
   bond=$1
   shift
   ports=$@

   $ECHO ovs-vsctl add-bond $bridge $bond $ports bond_mode=balance-tcp lacp=active \
	other-config:lacp-time=fast  other-config:bond-rebalance-interval=0
}

function ovs_add_bridge
{
   bridge=$1
   shift
   $ECHO ovs-vsctl add-br $bridge
}

function ovs_add_flow
{
   bridge=$1
   shift
   flows=$@
   $ECHO ovs-ofctl add-flow $bridge $flows 
}



