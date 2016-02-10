# Common test environment information, Should be in sync with ovsdb_server.sh
IP=127.0.0.1
PORT=9001

# XXX
OUTPUT_DIR=/tmp/mon-output
# XXX
MONITOR_METHOD=monitor2
# Table and columns to be monitored.  "ALL" can also be use for monitoring all tables and columns
MONITOR_COLUMNS="Interface"

CONN_SCALE=1000

rm -rf $OUTPUT_DIR
mkdir -p $OUTPUT_DIR

for i in `seq 1 $CONN_SACLE`; do
     ovsdb-client --detach --pidfile $MONITOR_METHOD $MONITOR_COLUMNS >$OUTPUT_DIR/$i &
done

read

killall ovsdb-client
