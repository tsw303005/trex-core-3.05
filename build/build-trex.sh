#!/bin/bash
set -e

ARCH=$1
PLATFORM=$2

# Build trex
docker run --network host --platform=linux/$PLATFORM --rm  -v ./build/output/$ARCH-build:/working/result -e RUNTIME_ARCH=${ARCH} trex-builder.$ARCH $(pwd)
