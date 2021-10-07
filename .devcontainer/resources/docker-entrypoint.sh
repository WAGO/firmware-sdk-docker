#!/bin/bash
ptxdist platform configs/wago-pfcXXX/platformconfig
ptxdist toolchain /opt/gcc-Toolchain-2019.12/arm-linux-gnueabihf/bin/
git lfs pull
$@
