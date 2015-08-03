openwrt-karma
=============

This is a repo that builds a firmware for a wr703n that has a modified hostapd
with the karma patch.

Usage
-----

First make the firmware:
```
make
```

Then scp it to the router and flash:
```
sysupgrade -v -n /tmp/openwrt-ar71xx-generic-tl-wr703n-v1-squashfs-sysupgrade.bin
```
