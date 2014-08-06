
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
run_l2tpconfig tunnel create tunnel_name=one dest_ipaddr=10.1.1.2 
run_l2tpconfig tunnel list 
run_l2tpconfig session create tunnel_name=one session_name=one ppp_profile_name=one
run_l2tpconfig session list tunnel_name=one
run_l2tpconfig session show tunnel_name=one session_name=one

