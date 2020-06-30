#! /usr/bin/env bash

#REGISTRY="index.docker.io/techgnosis"
#REGISTRY="gcr.io/your-project/build-service"
REGISTRY="harbor2.lab.home:30003/tbs"

duffle relocate -f ./build-service-0.2.0.tgz \
-m ./relocated.json \
-p "${REGISTRY}"

