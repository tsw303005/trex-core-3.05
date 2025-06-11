ARG UBUNTU_VERSION=24.04

ARG RUNTIME_ARCH=arm64v8

FROM ${RUNTIME_ARCH}/ubuntu:${UBUNTU_VERSION}

RUN apt update && apt install -y \
                        build-essential \
                        python3 \
                        python3-setuptools \
                        zlib1g-dev
																		
WORKDIR /working

RUN mkdir -p /working/trex-core

RUN mkdir -p /working/result

COPY . /working/trex-core/

RUN chmod -R 755 /working

RUN chmod 755 /working/trex-core/build/build.sh

ENTRYPOINT ["/bin/bash", "/working/trex-core/build/build.sh"]
