
## Install a necessary packages
sudo apt-get install kvm cloud-utils genisoimage
 
## URL to most recent cloud image of 12.04
img_url="https://cloud-images.ubuntu.com/xenial/current"
img_url="${img_url}/xenial-server-cloudimg-amd64-disk1.img"

## download the image
if [ ! -e disk.img.dist ]; then
  wget $img_url -O disk.img.dist
fi

## Create a file with some user-data in it
cat > my-user-data <<EOF
#cloud-config
password: passw0rd
chpasswd: { expire: False }
ssh_pwauth: True
EOF
 
## Convert the compressed qcow file downloaded to a uncompressed qcow2
qemu-img convert -O qcow2 disk.img.dist disk.img.orig

## Resize the image to 12G from original image of 2G
qemu-img resize disk.img.orig +10G

## create the disk with NoCloud data on it.
cloud-localds my-seed.img my-user-data
 
## Create a delta disk to keep our .orig file pristine
qemu-img create -f qcow2 -b disk.img.orig disk.img

