openwrt-ar71xx-generic-tl-wr703n-v1-squashfs-sysupgrade.bin: OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64
	make -C OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64 image \
		PROFILE=TLWR703 \
		PACKAGES="-ppp -ppp-mod-pppoe block-mount kmod-usb-storage kmod-fs-ext4 kmod-scsi-core e2fsprogs uhttpd" \
		FILES=../files
	cp OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64/bin/ar71xx/openwrt-ar71xx-generic-tl-wr703n-v1-squashfs-sysupgrade.bin .

OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64: OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2
	tar -xf OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2
	cp repositories.conf OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64

OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2:
	wget https://downloads.openwrt.org/barrier_breaker/14.07/ar71xx/generic/OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2

chroot:
	cp $(shell whereis qemu-mips-static | cut -d" " -f2) OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64/build_dir/target-mips_34kc_uClibc-0.9.33.2/root-ar71xx
	sudo chroot OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64/build_dir/target-mips_34kc_uClibc-0.9.33.2/root-ar71xx ./qemu-mips-static /bin/ash

clean:
	rm openwrt-ar71xx-generic-tl-wr703n-v1-squashfs-sysupgrade.bin || true

dist-clean: clean
	rm -rf OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64 || true
	rm OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2 || true
