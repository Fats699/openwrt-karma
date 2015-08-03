openwrt-ar71xx-generic-tl-wr703n-v1-squashfs-sysupgrade.bin: OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64
	cp -a files OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64/
	make -C OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64 image PROFILE=TLWR703 PACKAGES="-ppp -ppp-mod-pppoe block-mount kmod-usb-storage kmod-fs-ext4 kmod-scsi-core e2fsprogs" FILES=files
	cp OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64/bin/ar71xx/openwrt-ar71xx-generic-tl-wr703n-v1-squashfs-sysupgrade.bin .

OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64: OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2
	tar -xf OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2
	cp repositories.conf OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64

OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2:
	wget https://downloads.openwrt.org/barrier_breaker/14.07/ar71xx/generic/OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2
