N='-net nic,vlan=1,macaddr=52:54:22:EE:EE:02 -net tap,vlan=1,ifname=tap1,script=./ovs-ifup,downscript=./ovs-ifdown'
./coreos_production_qemu.sh -u user_data_coreos_2 -i coreos2.img -p 2223 -n '10.0.3.0/24' -nographic $N

