
cmd=/usr/local/sbin/nft

if [ "$1" == "-d" ]; then
	cmd="$cmd --debug all"
	shift
fi

$cmd $*

