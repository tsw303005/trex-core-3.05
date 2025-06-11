#!/bin/bash
set -e
# CLEAN_BUILD="--no-cache"

ARCH=$1
PLATFORM=$2

DOCKER_BUILDKIT=1 docker buildx build $CLEAN_BUILD --platform=linux/$PLATFORM --network host -t trex-builder.$ARCH --build-arg RUNTIME_ARCH=$ARCH -f build.Dockerfile .
