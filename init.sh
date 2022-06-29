#!/bin/bash
TAG=V03.09.07_21

export JFROG_APIKEY=$(cat /secrets/jfrog-api-key)

# svn checkout --username dirk.meihoefer@wago.com https://svsv01003.wago.local/svn/repo3/pfc/tags/wago-pfc200/$TAG/ wago-src/$TAG

cd /workspaces/firmware-sdk-docker/wago-src/$TAG/ptxproj
ptxdist platform configs/wago-pfcXXX/platformconfig 
ptxdist select configs/wago-pfcXXX/ptxconfig_pfc_g2
ptxdist toolchain /opt/gcc-Toolchain-2019.12/arm-linux-gnueabihf/bin
$SHELL
