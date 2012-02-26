#!/sbin/sh

sleep 2

if [[ "`grep clk= /proc/cmdline`" == "" ]]; then
sed -i 's/\/boot\t\tmtd/\/boot\t\tyaffs2/g' /etc/recovery.fstab
fi

## Required for twrp recovery
#mount /dev/block/mmcblk0p2 /sd-ext | grep sd-ext | awk '{print $5}'
#FS=`mount | grep sd-ext | awk '{print $5}'`
#umount /sd-ext
#sed -i 's/\/sd-ext\ \ \ \ \ auto/\/sd-ext\t\t'$FS'/g' /etc/recovery.fstab
#
#if [[ "`grep mmcblk0p2 /etc/fstab` " != "" ]]; then
#sed -i /mmcblk0p2/d /etc/fstab
#fi
#
#cat >> /etc/fstab << EOF
#/dev/block/mmcblk0p2 /sd-ext $FS rw
#EOF
