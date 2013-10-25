Clone the buildscripts repo. It has a file called "inch". Read the man
page by the same name there. If you don't want details, skip reading
it and follow the next steps.

Create an alias in your .bashrc for "inch" and point it to the one in
buildscripts repo.

mkdir rhel61
git  archive  --remote=repo.nicira.com:/srv/git/buildenv
openvswitch/rhel61_x86_64 | ( cd rhel61 && tar xv)


cd rhel61

touch .metadata

sudo ~/git/buildscripts/gitvm-meta-apply < .metadata   #Clone
buildscripts repo before hand.

touch .m64

inch -u root groupadd -g `id -g` `id -gn`

inch -u root useradd $LOGNAME -g `id -g` -u `id -u`

cd home/gshetty

git clone shettyg@repo.nicira.eng.vmware.com:/srv/git/openvswitch

cd openvswitch

./boot.sh

./configure

make

inch ./configure       --prefix=/usr      --localstatedir=/var
--sysconfdir=/etc
--with-linux=/lib/modules/2.6.32-131.6.1.el6.x86_64/build

inch make

inch make dist

cd ../

inch cat .rpmmacros

%_topdir            /home/gshetty/rpmbuild


inch mkdir -p rpmbuild/SOURCES rpmbuild/BUILD rpmbuild/RPMS/x86_64

cd rpmbuild

inch cp ../openvswitch/openvswitch-1.10.90.tar.gz .

inch cp ../openvswitch/openvswitch-1.10.90.tar.gz SOURCES/.

inch tar xfz openvswitch-1.10.90.tar.gz

cd openvswitch-1.10.90/

inch rpmbuild -bb rhel/openvswitch-kmod-rhel6.spec


* If you want to install new package:

sudo ~/git/buildscripts/inch su

* This will take you to root and it will look like you are in a own environment.

rpm2cpio *.rpm | cpio -id

http://pkgs.org/centos-6-rhel-6/centos-rhel-x86_64/bison-2.4.1-5.el6.x86_64.rpm/download/

* Creating an rpm is simple too. Just copy your tar.gz distribution to
/root/rpmbuild, untar it and do a rpmbuild -bb --clean rhel/*.spec
