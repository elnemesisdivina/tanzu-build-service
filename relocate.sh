#! /usr/bin/env bash

# relocated.json is very detached from ~/.duffle
# If you clear out that folder you can still use relocated images
# It takes forever to upload to DockerHub so this matters

#REGISTRY="index.docker.io/your-username"
REGISTRY="gcr.io/your-project/build-service"

duffle relocate -f ./build-service-0.1.0.tgz \
-m ./relocated.json \
-p "${REGISTRY}"

