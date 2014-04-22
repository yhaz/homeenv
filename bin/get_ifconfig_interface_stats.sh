ifconfig eth1 | grep TX | grep packets |awk '{print $2}' |sed s/packets://g
