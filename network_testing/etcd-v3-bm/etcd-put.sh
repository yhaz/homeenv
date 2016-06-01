export ETCDCTL_API=3

prefix=ovsdb/123456789012345678901234567890/

if test ! -z "$1"; then
    NUM_KEYS=$1
fi

for i in `seq 1 $NUM_KEYS`; do
     ./etcdctl  put $prefix$i "test" > /dev/null
done

# ./etcdctl get --prefix ovsdb

