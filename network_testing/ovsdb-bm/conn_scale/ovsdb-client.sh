if test -e env.conf; then
   . env.conf
else
   echo "Can't find env.conf. Exiting."
   exit 1
fi

cleanup ()
{
   pids=`find $PID_DIR -type f |wc -l`
   echo
   echo "killing $pids monitor sessions..."
   kill -9 `cat $PID_DIR/*`
   echo "Done."
}

trap "cleanup; exit" SIGHUP SIGINT SIGTERM

if test ! -z "$1"; then
    CONN_SCALE=$1
fi

rm -rf $OUTPUT_DIR $PID_DIR
mkdir -p $OUTPUT_DIR $PID_DIR

for i in `seq 1 $CONN_SCALE`; do
     ovsdb-client --detach --pidfile=$PID_DIR/$i $METHOD $COLUMNS >$OUTPUT_DIR/$i 
     if [[ $? != 0 ]]; then
        exit 1
     fi
done

echo "$i monitor sessions have started, hit CTRL-c to quit..."

# Sleep forever, waiting for user to hit CTRL-c
while true; do
  sleep 10
done

# Just in case
cleanup
