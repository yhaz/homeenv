mv /usr/sbin/ovs-vswitchd /usr/sbin/ovs-vswitchd.old
cp vswitchd/ovs-vswitchd /usr/sbin
service openvswitch-switch restart
gdb vswitchd/ovs-vswitchd `cat /run/openvswitch/ovs-vswitchd.pid`

