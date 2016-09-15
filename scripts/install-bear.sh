#!/bin/bash

bear_version=2.2.0

set -e

mkdir build
cd build
git clone -b ${bear_version} https://github.com/rizsotto/Bear.git
mkdir bear-build
cd bear-build
cmake ../Bear
make all
make install

cd ../..
rm -rf build
