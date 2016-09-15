#!/bin/bash

rtags_version=v2.3

set -e

mkdir build
cd build
git clone --recursive -b ${rtags_version} https://github.com/andersbakken/rtags.git
mkdir rtags-build
cd rtags-build
cmake ../rtags
make -j4
make install

cd ../..
rm -rf build
