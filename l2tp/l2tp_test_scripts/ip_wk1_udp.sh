ip l2tp add tunnel tunnel_id 4000 peer_tunnel_id 3000 encap udp local 10.1.1.1 remote 10.1.1.2 udp_sport 6000 udp_dport 5000
ip l2tp add session tunnel_id 4000 session_id 2000 peer_session_id 2000
ip link set l2tpeth0 up mtu 1488
