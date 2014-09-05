#
#from http://vincent.bernat.im/en/blog/2011-uml-network-lab.html#uml-configuration
#

mount -n -t proc proc /proc
mount -n -t sysfs sysfs /sys
mount -o bind /usr/lib/uml/modules /lib/modules
mount -n -t tmpfs tmpfs /tmp -o rw,nosuid,nodev
exec chroot /home/azhou/uml-test /bin/bash

