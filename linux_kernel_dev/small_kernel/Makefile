#
# Build a small kernel and root file system that run in QEMU;
# by following  mgalgs.github.io
# 

# Default environement variables

TOP ?= $(shell pwd)
KERNEL ?= linux-4.0.3
BUSYBOX ?= busybox-1.23.2
INITRAMFS ?= initramfs
OBJDIR = _x86
CONFIGTOOL=~/bin/config

BUSYBOX_DL_FILE=$(BUSYBOX).tar.bz2
KERNEL_DL_FILE=$(KERNEL).tar.xz
KERNEL_bzImage=$(TOP)/$(KERNEL)/$(OBJDIR)/arch/x86/boot/bzImage

$(TOP)/$(BUSYBOX_DL_FILE):
	( cd $(TOP); \
	  curl -O https://busybox.net/downloads/$(BUSYBOX_DL_FILE).tar.bz2 )

$(TOP)/$(BUSYBOX)/$(OBJDIR)/.config: $(TOP)/$(BUSYBOX_DL_FILE)
	(cd $(TOP); tar xjf $(BUSYBOX_DL_FILE))
	mkdir -p $(TOP)/$(BUSYBOX)/$(OBJDIR)
	(cd $(TOP)/$(BUSYBOX); \
	make O=$(OBJDIR) defconfig; \
	# enable CONFIG_STATIC  \
	config --file $(TOP)/$(BUSYBOX)/$(OBJDIR)/.config --enable static; \
	# disable CONFIG_DESKTOP  \
	config --file $(TOP)/$(BUSYBOX)/$(OBJDIR)/.config --disable desktop; \
	# change CONFIG_EXTRA_CFLAGS to "-m32 -march=i386"  \
	config --file $(TOP)/$(BUSYBOX)/$(OBJDIR)/.config --set-str extra_cflags "-m32 -march=i386"; \
	make O=$(OBJDIR) oldconfig \
	)

build_busybox: $(TOP)/$(BUSYBOX)/$(OBJDIR)/.config
	(cd $(TOP)/$(BUSYBOX)/$(OBJDIR); make -j8; make install;)

.PHONY: build_initramfs_dir
build_initramfs_dir: build_busybox
	mkdir -p $(TOP)/$(INITRAMFS)/$(OBJDIR)
	cp busybox_init $(TOP)/$(INITRAMFS)/$(OBJDIR)/init
	chmod +x $(TOP)/$(INITRAMFS)/$(OBJDIR)/init
	(cd $(TOP)/$(INITRAMFS)/$(OBJDIR); \
	mkdir -pv bin sbin etc proc sys usr/bin usr/sbin; \
	cp -av $(TOP)/$(BUSYBOX)/$(OBJDIR)/_install/* . )

$(TOP)/initramfs-busybox-x86.cpio.gz: build_initramfs_dir
	(cd $(TOP)/$(INITRAMFS)/$(OBJDIR); \
	find . -print0 \
		| cpio --null -ov --format=newc \
		| gzip -9 > $@ )

$(TOP)/$(KERNEL_DL_FILE):
	(cd $(TOP); \
	curl -O https://www.kernel.org/pub/linux/kernel/v4.x/$(KERNEL_DL_FILE) )

$(KERNEL_bzImage): $(TOP)/$(KERNEL_DL_FILE)
	(cd $(TOP); tar xJf $(KERNEL_DL_FILE))
	(cd $(TOP)/$(KERNEL); make O=$(OBJDIR) defconfig)
	(cd $(TOP)/$(KERNEL); make O=$(OBJDIR) kvmconfig)
	(cd $(TOP)/$(KERNEL); make O=$(OBJDIR) -j8)

.PHONY: kernel
kernel: $(KERNEL_bzImage)

.PHONY: all
all: $(TOP)/initramfs-busybox-x86.cpio.gz $(KERNEL_bzImage)

qemu_debug=-s -S
#qemu_debug=

.PHONY: run
run:
	(cd $(TOP); qemu-system-i386 -kernel $(KERNEL_bzImage) \
		-initrd $(TOP)/initramfs-busybox-x86.cpio.gz \
		$(qemu_debug) -nographic -append "console=ttyS0 loglevel=10" )

.PHONY: clean_busybox
clean_busybox:
	rm -rf $(TOP)/$(BUSYBOX)

.PHONY: veryclean
veryclean: clean_busybox

