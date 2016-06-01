export ETCDCTL_API=3

prefix=ovsdb/12345678901234567890/

if test ! -z "$1"; then
    NUM_KEYS=$1
fi

echo "mod(\"ovsdb\") = \"0\" " > /tmp/txn
echo >> /tmp/txn

for i in `seq 1 $NUM_KEYS`; do
     echo "put $prefix$i test" >> /tmp/txn
done
echo >> /tmp/txn
echo >> /tmp/txn

# cat /tmp/txn

time ./etcdctl txn < /tmp/txn > /dev/null

# ./etcdctl get --prefix ovsdb

