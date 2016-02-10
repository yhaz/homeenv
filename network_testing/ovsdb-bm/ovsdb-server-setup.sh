ovs-vsctl set-manager ptcp:9001 -- set Manager ptcp:9001 inactivity_probe=20000
ovs-appctl -t ovsdb-server ovsdb-server/add-remote db:Open_vSwitch,Manager,target
ovs-vsctl list Manager

ovs-appctl -t ovsdb-server vlog/set ::dbg

