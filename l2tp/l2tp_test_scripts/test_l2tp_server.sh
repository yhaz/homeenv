
function stop_openl2tpd {
	echo -n $"Stopping $prog: "
	sudo killall openl2tpd
	sudo killall openl2tpd
	sudo modprobe -s -r pppol2tp || modprobe -s -r l2tp_ppp
	echo
	sudo rm -f /var/run/openl2tpd.pid
        sudo rm -f /var/lock/subsys/openl2tpd
	return 0
}	

#restart openl2tpd
stop_openl2tpd
sudo modprobe l2tp_ppp 
sudo openl2tpd

function run_l2tpconfig {
   echo "---> " $*
   l2tpconfig $*
}

# If pppd is being used, test that it can load the pppol2tp plugin.
#
#  sudo /usr/sbin/pppd debug nodetach noauth plugin pppol2tp.so pppol2tp 42
# 
# should output something like:
#    Plugin pppol2tp.so loaded.
#    Given FD for PPPoL2TP socket invalid (Bad file descriptor)
#

run_l2tpconfig system show version
run_l2tpconfig peer profile create profile_name=one peer_ipaddr=10.1.1.1 ppp_profile_name=one 
run_l2tpconfig ppp profile create profile_name=one local_ipaddr=10.3.1.2 remote_ipaddr=10.3.1.1 auth_none=yes
run_l2tpconfig ppp profile modify profile_name=default auth_none=yes

