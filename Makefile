openwrt-15.05-ar71xx-generic-tl-wr703n-v1-squashfs-sysupgrade.bin: OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64
	make -C OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64 image \
		PROFILE=TLWR703 \
		PACKAGES="-ppp -ppp-mod-pppoe block-mount kmod-usb-storage kmod-fs-ext4 kmod-scsi-core e2fsprogs uhttpd" \
		FILES=../files
	cp OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64/bin/ar71xx/openwrt-15.05-ar71xx-generic-tl-wr703n-v1-squashfs-sysupgrade.bin .

OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64: OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64.tar.bz2
	tar -xf OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64.tar.bz2
	cp repositories.conf OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64

OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64.tar.bz2:
	wget https://downloads.openwrt.org/chaos_calmer/15.05/ar71xx/generic/OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64.tar.bz2

chroot:
	cp $(shell whereis qemu-mips-static | cut -d" " -f2) OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64/build_dir/target-mips_34kc_uClibc-0.9.33.2/root-ar71xx
	sudo chroot OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64/build_dir/target-mips_34kc_uClibc-0.9.33.2/root-ar71xx ./qemu-mips-static /bin/ash

clean:
	rm openwrt-15.05-ar71xx-generic-tl-wr703n-v1-squashfs-sysupgrade.bin || true

dist-clean: clean
	rm -rf OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64 || true
	rm OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64.tar.bz2 || true
