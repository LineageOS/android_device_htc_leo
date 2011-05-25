#!/sbin/sh

sleep 2

if [[ "`grep clk= /proc/cmdline`" == "" ]]; then
sed -i 's/\/boot\t\tmtd/\/boot\t\tyaffs2/g' /etc/recovery.fstab
fi
