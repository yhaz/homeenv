
# sudo ip tuntap add dev tap0 mode tap user azhou

#ADDED=-net nic,vlan=0,model=e1000,macaddr=52:54:00:00:00:01 -net tap,vlan=0,ifname=tap0,script=no,downscript=no
all: disk.img launch

force-my-user-data:
	touch generate_user_data.sh
	touch generate_meta_data.sh

my-user-data: generate_user_data.sh
	./generate_user_data.sh > my-user-data
	
my-meta-data: generate_meta_data.sh
	./generate_meta_data.sh > my-meta-data

my-seed.img: my-user-data my-meta-data
	cloud-localds my-seed.img my-user-data my-meta-data

disk.img: my-seed.img
	qemu-img create -f qcow2 -b ../disk.img.orig disk.img

FWD=hostfwd=tcp:127.0.0.1:5022-10.0.0.1:22

#ADDED=-device e1000,netdev=network0,mac=52:54:00:00:00:01 -netdev tap,id=network0,ifname=tap0,script=no,downscript=no -nographic

ADDED=-net nic -net user,${FWD} -nographic

include ../make.base


clean:
	rm -rf my-*-data
	rm -rf *.img

