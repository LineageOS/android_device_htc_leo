#!/bin/sh
# This script is included in squisher
# It is the final build step (after OTA package)

echo "updater-script: Making Compatible Update script"
cd $REPACK/ota/META-INF/com/google/android
echo 'mount("yaffs2", "MTD", "boot", "/boot");' >> temp
echo 'package_extract_dir("boot", "/boot");' >> temp
echo 'unmount("/boot");' >> temp
grep -vw assert  updater-script >> temp
rm -rf updater-script
grep -vw boot.img  temp > updater-script
rm -rf temp

cd $REPACK/ota
echo "Removing: $REPACK/ota/boot.img"
rm -rf $REPACK/ota/boot.img
echo "Removing: $REPACK/ota/boot"
rm -rf $REPACK/ota/boot

echo "Copying: $OUT/boot ($REPACK/ota/boot)"
cp -a $OUT/boot $REPACK/ota/boot

if [ ! -e $REPACK/ota/boot/initrd.gz ] ; then
  echo "Copying: $OUT/ramdisk.img ($REPACK/ota/boot/initrd.gz)"
  cp -a $OUT/ramdisk.img $REPACK/ota/boot/initrd.gz
fi

