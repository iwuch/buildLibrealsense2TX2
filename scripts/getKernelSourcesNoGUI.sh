#!/bin/bash
apt-add-repository universe
apt-get update
apt-get install pkg-config -y
cd /usr/src
# wget -N https://developer.nvidia.com/embedded/dlc/l4t-sources-32-1-JAX-TX2
# wget -N https://developer.nvidia.com/embedded/dlc/l4t-sources-31-1-0
# l4t-sources-31-1-0 is a tbz2 file
# wget -N https://developer.download.nvidia.com/embedded/L4T/r32_Release_v1.0/jax-tx2/BSP/JAX-TX2-public_sources.tbz2
# sudo tar -xvf JAX-TX2-public_sources.tbz2 public_sources/kernel_src.tbz2
# tar -xvf public_sources/kernel_src.tbz2
#tar -xvf l4t-sources-32-1-JAX-TX2 public_sources/kernel_src.tbz2

#第一行下载代码，把对应版本号的L4T内核下载下来
wget -N https://developer.nvidia.com/embedded/dlc/r32-2-1_Release_v1.0/TX2-AGX/sources/public_sources.tbz2
#第二行代码解压源代码到public_sources/kernel_src.tbz2中
sudo tar -xvf public_sources.tbz2 public_sources/kernel_src.tbz2

# Space is tight; get rid of the compressed kernel source
rm -r public_sources
cd kernel/kernel-4.9
# Go get the default config file; this becomes the new system configuration
zcat /proc/config.gz > .config

