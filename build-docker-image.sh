#!/bin/bash
set -e

SVN_TAG=V03.09.07_21
IMAGE_NAME=wagoautomation/pfc-firmware-base:FW21-03.09.07

# .devcontainer/scripts/init-subversion-src.sh $SVN_TAG
# cd src/$SVN_TAG/ptxproj
# ptxdist images -q -j
docker build --platform=linux/arm/v7 -t $IMAGE_NAME .