
mac=$1
ssh pxeuser@suite.eng.vmware.com ./PXEconfig.pl -d pa-group/nicira -f tftpboot/pxelinux.cfg/default -m $mac -l HTB -p

