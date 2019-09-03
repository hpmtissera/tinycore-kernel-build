#!/usr/bin/env bash

set -e

TC_KERNEL_VERSION=4.19.10-tinycore64

mkdir -p /opt/tinycore/10.x/x86_64/release/distribution_files
cp /opt/build/10.x/* /opt/tinycore/10.x/x86_64/release/distribution_files

git clone https://github.com/hpmtissera/tinycore-kernel.git
cd tinycore-kernel

make -j$(nproc) kernel
make -j$(nproc) extensions
make -j$(nproc) os

cd ..
mkdir kernel-artifacts
cd kernel-artifacts
cp /tmp/tinycore-kernel-build/vmlinuz64 .
cp /tmp/tinycore-kernel-build/corepure64 .
cp /tmp/tinycore-kernel-build/filesystems-4.19.10-tinycore64.tcz .
cp /tmp/tinycore-kernel-build/ipv6-4.19.10-tinycore64.tcz .
cp /tmp/tinycore-kernel-build/mtd-4.19.10-tinycore64.tcz .
cp /tmp/tinycore-kernel-build/netfilter-4.19.10-tinycore64.tcz .
cp /tmp/tinycore-kernel-build/raid-dm-4.19.10-tinycore64.tcz .
cp /tmp/tinycore-kernel-build/scsi-4.19.10-tinycore64.tcz .
cp /tmp/tinycore-kernel-build/linux-4.19.10/.config .
cp /tmp/tinycore-kernel-build/linux-4.19.10/Module.symvers .
