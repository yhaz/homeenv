N='-net nic,vlan=1,macaddr=52:54:22:ee:ee:01 -net tap,vlan=1,script=./ovs-ifup,downscript=./ovs-ifdown'
./coreos_production_qemu.sh -u user_data_coreos_1 -i coreos1.img -nographic $N
