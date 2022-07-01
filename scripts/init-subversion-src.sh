#!/bin/bash
set -e

TAG=V03.09.07_21

#The directory /secrets is mounted from the user home directory in the host system, see the mounts section in .devcontainer/devcontainer.json
echo "export JFROG_APIKEY=$(cat /secrets/jfrog-api-key)" >> ~/.profile
source ~/.profile

echo Subversion user name?
read NAME
svn checkout --username $NAME https://svsv01003.wago.local/svn/repo3/pfc/tags/wago-pfc200/$TAG/ src/$TAG

cd /workspaces/firmware-sdk-docker/src/$TAG/ptxproj
ptxdist platform configs/wago-pfcXXX/platformconfig 
ptxdist select configs/wago-pfcXXX/ptxconfig_pfc_g2
ptxdist toolchain /opt/gcc-Toolchain-2019.12/arm-linux-gnueabihf/bin
$SHELL
