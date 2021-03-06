setup_link()
{
	ip link set l2tpeth0 up mtu 1488
	ip addr add 7.1.1.1 peer 7.1.1.2 dev l2tpeth0
}

stop_link()
{
	ip l2tp del session tunnel_id 4000 session_id 2000 
	ip l2tp del tunnel tunnel_id 4000 
	ifconfig l2tpeth0 0
}

start_udp()
{
	ip l2tp add tunnel tunnel_id 4000 peer_tunnel_id 3000 encap udp local 10.1.1.1 remote 10.1.1.2 udp_sport 6000 udp_dport 5000

	ip l2tp add session tunnel_id 4000 session_id 2000 peer_session_id 1000

	setup_link
}

stop_udp()
{
	stop_link
}

start_ip()
{
	ip l2tp add tunnel tunnel_id 4000 peer_tunnel_id 3000 encap ip local 10.1.1.1 remote 10.1.1.2 

	ip l2tp add session tunnel_id 4000 session_id 2000 peer_session_id 1000

	setup_link
}

stop_ip()
{
	stop_link
}

modprobe l2tp_eth
modprobe l2tp_ip

case $1 in 
	--start-udp)
		start_udp
	shift
	;;
	--start-ip)
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

