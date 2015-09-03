I=$1
OUTPUT_DIR=/tmp/mon-output
P=ovsdb-client
#DB=unix:/home/azhou/projs/ovs/tutorial/sandbox/db.sock
rm -rf $OUTPUT_DIR
mkdir -p $OUTPUT_DIR
for i in `seq 1 $I`; do
	$P monitor $DB Port >$OUTPUT_DIR/$i &
done

read

killall $P
