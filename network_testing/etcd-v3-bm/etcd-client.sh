export ETCDCTL_API=3
OUTPUT_DIR=/tmp/etcd_bm
CONN_SCALE=10000

cleanup ()
{
   killall -9 etcdctl
   echo "Done."
}

trap "cleanup; exit" SIGHUP SIGINT SIGTERM

if test ! -z "$1"; then
    CONN_SCALE=$1
fi

rm -rf $OUTPUT_DIR
mkdir -p $OUTPUT_DIR 

for i in `seq 1 $CONN_SCALE`; do
     ./etcdctl  watch --prefix ovsdb > $OUTPUT_DIR/$i &
     #./etcdctl  watch --prefix o1 > /dev/null &
     #./etcdctl  watch --prefix o2 > /dev/null &
     #./etcdctl  watch --prefix o3 > /dev/null &
     #./etcdctl  watch --prefix o4 >  /dev/null &
     if [[ $? != 0 ]]; then
        cleanup;
        exit 1
     fi
done

echo "$i monitor sessions have started, hit CTRL-c to quit..."

# Sleep forever, waiting for user to hit CTRL-c
while true; do
  sleep 10
done

# Just in case
cleanup;
exit 0
