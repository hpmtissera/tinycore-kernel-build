#!/usr/bin/env bash

echo -e "This script will build Tiny Core Kernel: 4.19.10-tinycore64\n"

docker build -t kernel-build .
docker run --volume "$(pwd):/opt/build" --cidfile=containerid  -u root kernel-build sh -c "/opt/build/build-kernel.sh"

CONTAINER_ID=$(cat containerid)
docker cp ${CONTAINER_ID}:/kernel-artifacts ./

docker rm -f ${CONTAINER_ID}
rm containerid
