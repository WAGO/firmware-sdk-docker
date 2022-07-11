#!/bin/bash
set -e

USER=$1
PASSWORD=$2
SVN_TAG=${3:-V03.09.07_21}
IMAGE_TAG=${4:-FW21-03.09.07}

IMAGE_NAME=wagoautomation/pfc-firmware-base

.devcontainer/scripts/init-subversion-src.sh $SVN_TAG $USER $PASSWORD 
cd src/$SVN_TAG/ptxproj
# ptxdist images -q -j

cd /workspaces
docker build --platform=linux/arm/v7 --build-arg SOURCE_DIR=$SVN_TAG  -t $IMAGE_NAME:$IMAGE_TAG .