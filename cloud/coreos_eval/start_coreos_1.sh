N='-net nic,macaddr=52:54:22:EE:EE:EE -net tap,script=./ovs-ifup,downscript=./ovs-ifdown'
./coreos_production_qemu.sh -u user_data_coreos_1 -i coreos1.img -nographic $N
