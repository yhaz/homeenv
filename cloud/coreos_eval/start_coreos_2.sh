N='-net nic,macaddr=52:54:22:EE:EE:01 -net tap,ifname=tap1,script=./ovs-ifup,downscript=./ovs-ifdown'
./coreos_production_qemu.sh -u user_data_coreos_2 -i coreos2.img -p 2223 -n '10.0.3.0/24' -nographic $N

