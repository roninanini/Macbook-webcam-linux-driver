#!/bin/bash

set +x

sudo apt install git curl cpio
sudo apt install kmod libssl-dev checkinstall


rm -f facetimehd-firmware
rm -f bcwc_pcie

git clone https://github.com/patjak/facetimehd-firmware.git
cd facetimehd-firmware
make clean
make
sudo make install

cd ..

sudo apt install kmod libssl-dev checkinstall
git clone https://github.com/patjak/bcwc_pcie.git
cd bcwc_pcie
make clean
make
sudo make install

sudo depmod
sudo modprobe facetimehd
