#! /usr/bin/env bash

#REGISTRY="index.docker.io/your-username"
#REGISTRY="gcr.io/your-project/build-service"
REGISTRY="harbor.lab.home/library"

duffle relocate -f ./build-service-0.2.0.tgz \
-m ./relocated.json \
-p "${REGISTRY}"

