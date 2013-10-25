Manual openvswitch package creation
=====================================

I had some trouble doing this when I tried it the first time. So, here is a documentation on how to get started.

Goal: Build rpms of openvswitch to install on a xenserver of your choice (among many options. You can't do this for every xenserver build).

Figuring out your xenserver build no:
* Go to your xenserver and do a *cat /etc/xensource-inventory*. This will give the build-no corresponding to that xenserver. (ex: BUILD_NUMBER='47101p')

Creating the build:
* Choose a linux based build machine that has considerable disk space (~60G) ( I chose a Debian squeeze (64-bit): mainly for the apt-get utility)
* Install Git on your debian box.
* git clone repo.nicira.com:/src/git/buildscripts
* The *buildscripts*  repo has a very crisp README file which talks about the packages that you need.
* I needed to do this: apt-get install socat git-core apt-utils apache2 sudo autoconf automake pkg-config gcc make python
* Follow the instructions in it regarding *visudo*
* cd buildscripts
* ./buzz init
* ./build-ovs -h : Will give you the help options which is quite overwhelming.
* grep for your xenserver build_number in build-ovs. If it exists, you can build rpms for it.


* If you have the password for root@bb-buildenv, you can ignore the steps related to local cloning of buildenv and openvswitch repo.
* Do a git clone of buildenv (This is a very large repo (~6G).) and openvswitch repo.  Make sure, you use the --mirror switch
  - git clone --mirror repo.nicira.com:/srv/git/buildenv
    - git clone --mirror repo.nicira.com:/srv/git/openvswitch


    * In your buildscripts directory, you can add the following block inside the file *build-ovs* (This is for customization. You don't need this)
    --- a/build-ovs
    +++ b/build-ovs
    @@ -492,6 +492,18 @@ opt_official_ri5 () {
         COVERAGE_TREES=
	  
    }
     
     +opt_unofficial_gshetty () {
     +    UPLOAD=false
     +    TAG_BUILDS=false
     +    MAILTO=default
     +    BUILDNR=buzzd
     +    OPENVSWITCH_BRANCH=master
     +    DEBIAN_DISTS=""
     +    DEB_KERNELS_squeeze_amd64=""
     +    DEB_KERNELS_squeeze_i386=""
     +    XENDDKS='56100build47101'
     +    COVERAGE_TREES=
     +
     }

     * Now from your buildscripts directory run the following command.
       - /build-ovs --unofficial-gshetty --buildenv-repo=/home/gshetty/git2/buildenv --openvswitch-repo=/home/gshetty/git2/openvswitch.git --no-debian-dists  --no-ubuntu-dists --no-rhel-dists  --build-number=99999
        - Your build should succeed. and you can see the rpms in *buildscripts/builds/openvswitch99999*
	* You can also specify which openvswitch version you want to use. 
	* You can do a *./clean-builds 0* to clean all your builds.

	Reference:
	 - Many thanks to Edwin Chiu for all the above information.
