
HOSTNAME=$1

hostname -b $HOSTNAME
export TERM=xterm
export PATH=/usr/local/bin:/usr/bin:/bin:/sbin:/usr/local/sbin:/usr/sbin
mount -t proc proc /proc
mount -t sysfs sysfs /sys
mount -t tmpfs tmpfs /var/run -o rw,nosuid,nodev
mount -t tmpfs tmpfs /var/log -o rw,nosuid,nodev
mount -o remount,rw /

