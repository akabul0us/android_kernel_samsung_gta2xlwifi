#!/usr/bin/env bash
ak3path="AnyKernel3/Image.gz-dtb"
if [ ! -d "AnyKernel3" ]; then
	echo "No AnyKernel3 directory found"
	exit 1
fi
kernel="$(find . -name Image.gz-dtb -not -path '*/AnyKernel3/*')"
if [ -f "$ak3path" ]; then
	chk1="$(md5sum $ak3path)"
	chk2="$(md5sum $kernel)"
	if [[ "$chk1" == "$chk2" ]]; then
		echo "Kernel at $kernel is the same file as $ak3path"
	else
		echo "Overwriting $ak3path with $kernel"
		cp $kernel $ak3path
	fi
else
	cp $kernel AnyKernel3
fi
cd AnyKernel3
zipname="gta2xlwifi-$(date +%H%M%S-%d%m%y).zip"
zip -r9 ../$zipname * && echo "Zip created: $zipname"

