#!/bin/bash

cd src
FIRMWARE_VERSION=$(git tag --merged)
cd ..
IMAGE_NAME=wagoautomation/$(gitversion /showvariable BranchName):$FIRMWARE_VERSION-v$(gitversion /showvariable MajorMinorPatch)
echo "Creating docker image " $IMAGE_NAME
docker build --platform=linux/arm/v7 -t $IMAGE_NAME .