ifconfig_base=`~/bin/get_ifconfig_interface_stats.sh eth1`
ovsdb_base=`~/bin/get_ovsdb_interface_stats.sh eth1`

#iperf -c 1.1.1.1 -t 10 -P 4

for i in `seq 0 100`
do
	ifconfig_last=`~/bin/get_ifconfig_interface_stats.sh eth1`
	ovsdb_last=`~/bin/get_ovsdb_interface_stats.sh eth1`

	echo "ifconfig pkts" $(($ifconfig_last - $ifconfig_base))
	echo "ovsdb pkts" $(($ovsdb_last - $ovsdb_base))

	sleep 1
done
