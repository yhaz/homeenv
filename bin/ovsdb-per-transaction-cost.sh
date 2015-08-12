ovs-vsctl add-br br0
ovs-appctl -t ovsdb-server ovsdb-server/perf-counters-clear
for i in `seq 0 100`; do
   ovs-vsctl add-port br0 p$i
done
ovs-appctl -t ovsdb-server ovsdb-server/perf-counters-show
ovs-vsctl del-br br0




