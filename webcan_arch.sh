#!/bin/bash
set +x
sudo rm -r facetimehd
sudo rm -r facetimehd-firmware
sudo git clean -fxd
pacman -S linux-headers git kmod
git clone https://github.com/patjak/facetimehd-firmware.git && cd facetimehd-firmware
make
make install
cd ..
git clone https://github.com/patjak/facetimehd.git && cd facetimehd
make
make install
depmod
modprobe facetimehd

