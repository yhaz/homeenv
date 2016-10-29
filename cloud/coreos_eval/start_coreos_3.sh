N='-net nic,vlan=1,macaddr=52:54:22:EE:EE:03 -net tap,vlan=1,ifname=tap2,script=./ovs-ifup,downscript=./ovs-ifdown'
sudo ./coreos_production_qemu.sh -u ./user_data_coreos_3 -i ./coreos3.img -p 2224 -n '10.0.4.0/24' -nographic $N

