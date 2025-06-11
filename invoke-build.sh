#!/bin/bash
set -e

ARCH_LIST="arm64v8 amd64"

sudo rm -rf ./build/output/*

mkdir -p ./build/output

for ARCH in $ARCH_LIST
do
	if [ $ARCH == "arm64v8" ]; then
		PLATFORM="arm64"
	else
		PLATFORM="amd64"
	fi

	echo "Building trex for $ARCH..."
	./build/build-docker-image.sh $ARCH $PLATFORM
	./build/build-trex.sh $ARCH $PLATFORM
done
