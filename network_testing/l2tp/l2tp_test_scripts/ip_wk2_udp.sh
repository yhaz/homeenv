setup_link()
{
	ip link set l2tpeth0 up mtu 1488
	ip addr add 7.1.1.2 peer 7.1.1.1 dev l2tpeth0
}

stop_link()
{
	ip l2tp del session tunnel_id 3000 session_id 1000 
	ip l2tp del tunnel tunnel_id 3000 
	ifconfig l2tpeth0 0
}

start_udp()
{
	ip l2tp add tunnel tunnel_id 3000 peer_tunnel_id 4000 encap udp local 10.1.1.2 remote 10.1.1.1 udp_sport 5000 udp_dport 6000
	ip l2tp add session tunnel_id 3000 session_id 1000 peer_session_id 2000
	setup_link
}

stop_udp()
{
	stop_link
}

start_ip()
{
	ip l2tp add tunnel tunnel_id 3000 peer_tunnel_id 4000 encap ip local 10.1.1.2 remote 10.1.1.1
	ip l2tp add session tunnel_id 3000 session_id 1000 peer_session_id 2000
	setup_link
}

stop_ip()
{
	stop_link
}

insmod()
{
	modprobe l2tp_debugfs
	modprobe l2tp_eth
	modprobe l2tp_ip

	mkdir -p /debug
	mount -t debugfs debugfs /debug
	cat /debug/l2tp/tunnels
}

rmmod()
{
	rmmod l2tp_debugfs
	rmmod l2tp_eth
	rmmod l2tp_ip
	rmmod l2tp_netlink
	rmmod l2tp_core
}


case $1 in 
	--insmod)
		insmod
	shift
	;;
	--rmmod)
		rmmod
	shift
	;;
	--start-udp)
		insmod
		start_udp
	shift
	;;
	--start-ip)
		insmod
		start_ip
	shift
	;;
	--stop-udp)
		stop_udp
	shift
	;;
	--stop-ip)
		stop_ip
	shift
	;;
	*)
	shift
	;;
esac

