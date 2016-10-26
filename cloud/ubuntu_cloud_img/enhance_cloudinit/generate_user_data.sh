
cat  << EOF
#cloud-config

user: ubuntu
password: passw0rd
chpasswd: { expire: False }
ssh_pwauth: True
hostname: ubuntu
manage_etc_hosts: true

EOF
