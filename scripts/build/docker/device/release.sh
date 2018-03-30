#!/bin/bash

IMAGETAG=kktech/firmware:v6-beta

docker pull $IMAGETAG

docker run -t \
  -v $(pwd):/root/keepkey-firmware \
  -v $(pwd)/deps/device-protocol:/root/keepkey-firmware/deps/device-protocol $IMAGETAG /bin/sh -c "\
      mkdir /root/build && cd /root/build && \
      cmake -C /root/keepkey-firmware/cmake/caches/device.cmake /root/keepkey-firmware \
        -DCMAKE_BUILD_TYPE=Release && \
      make && \
      mkdir -p /root/keepkey-firmware/bin && \
      cp bin/*.bin /root/keepkey-firmware/bin/"
