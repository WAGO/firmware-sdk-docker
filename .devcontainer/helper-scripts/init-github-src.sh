#!/bin/bash
set -e

TAG=${1:-FW21-V03.09.04}

mkdir -p src/$TAG
cd src/$TAG
wget https://github.com/WAGO/pfc-firmware-sdk-G2/archive/refs/tags/$TAG.tar.gz
tar -xvf $TAG.tar.gz -C . --strip-components 1
rm $TAG.tar.gz

ptxdist platform configs/wago-pfcXXX/platformconfig 
ptxdist select configs/wago-pfcXXX/ptxconfig_pfc_g2
ptxdist toolchain /opt/gcc-Toolchain-2019.12/arm-linux-gnueabihf/bin
$SHELL
