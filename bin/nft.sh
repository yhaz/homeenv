
cmd=/usr/local/sbin/nft

if [ "$1" == "-d" ]; then
	cmd="$cmd --debug all"
	shift
fi

if [ "$1" == "-g" ]; then
	cmd="gdb --args $cmd --debug all"
	shift
fi

$cmd $*

