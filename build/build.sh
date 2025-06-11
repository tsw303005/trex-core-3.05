#!/bin/bash
set -e

ARCH=$(uname -m)

cd /working/trex-core/linux_dpdk

if [ $ARCH == "aarch64" ]; then
	/bin/bash ./b configure --no-bnxt --no-mlx=all
else
	/bin/bash ./b configure
fi

./b build

cp -r /working/trex-core/linux_dpdk /working/result/
cp -r /working/trex-core/scripts /working/result/
