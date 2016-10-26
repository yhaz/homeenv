cat  << EOF
#cloud-config

instance-id: iid-abcdefg
network-interfaces: |
    auto ens3
    iface ens3 inet static
    address 10.0.0.1
    netmask 255.255.0.0
    broadcast 10.0.255.255
    gateway 10.0.0.1

bootcmd:
    - ifdown ens3
    - ifup ens3
EOF
