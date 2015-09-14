#!/sbin/sh
cd /tmp/
dd if=/dev/block/mmcblk0p5 of=/tmp/boot.img
/tmp/unpackbootimg /tmp/boot.img
/tmp/mkbootimg --kernel /tmp/zImage --ramdisk /tmp/boot.img-ramdisk.gz --cmdline "" --base 0x82000000 --pagesize 4096 -o /tmp/fenerbahceboot.img
dd if=/tmp/fenerbahceboot.img of=/dev/block/mmcblk0p5
busybox chmod 644 /system/lib/modules/*
