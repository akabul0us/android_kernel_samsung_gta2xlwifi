#!/usr/bin/env bash
if [ ! -d "AnyKernel3" ]; then
	echo "No AnyKernel3 directory found"
	exit 1
fi
kernel="$(find . -name Image.gz-dtb)"
cp $kernel AnyKernel3
cd AnyKernel3
zipname="gta2xlwifi-$(date +%H%M%S-%d%m%y).zip"
zip -r9 ../$zipname *
echo "Zip created: $zipname"

