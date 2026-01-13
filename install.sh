#!/bin/bash

# Deactivate conda so it's not local
conda deactivate 
source deactivate

sudo apt install openjdk-11-jdk
sudo apt install libhdf5-dev hdf5-tools
sudo apt install libtiff-dev
sudo apt install libboost-all-dev
sudo apt install libfreeimage3 libfreeimage-dev
sudo apt install liblz4-dev

cd ImarisConvertBioformats
mkdir build
cd build

cmake .. \
  -DFreeImage_LIBRARIES=/usr/lib/x86_64-linux-gnu/libfreeimage.so \
  -DJAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 \
  -DJRE_HOME=/usr/lib/jvm/java-17-openjdk-amd64 \
  -DCMAKE_BUILD_TYPE=Release

make -j$(nproc)

echo "Installation completed"