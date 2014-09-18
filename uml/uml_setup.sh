HOSTNAME=ovs-test
hostname -b $HOSTNAME

export TERM=xterm
mount -t sysfs sysfs /sys
mount -t tmpfs tmpfs /var/run -o rw,nosuid,nodev
mount -t tmpfs tmpfs /var/log -o rw,nosuid,nodev
mount -o remount,rw /

export PATH=/usr/local/bin:/usr/bin:/bin:/sbin:/usr/local/sbin:/usr/sbin:.:/home/azhou/bin
mount -t proc proc /proc
export MAKE=make
