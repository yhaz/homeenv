ip l2tp add tunnel tunnel_id 3000 peer_tunnel_id 4000 encap udp local 10.1.1.2 remote 10.1.1.1 udp_sport 5000 udp_dport 6000
ip l2tp add session tunnel_id 3000 session_id 1000 peer_session_id 2000
ip link set l2tpeth0 up mtu 1488
