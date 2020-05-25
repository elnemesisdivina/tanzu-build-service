#! /usr/bin/env bash

pb image delete index.docker.io/techgnosis/mysql 2> /dev/null
pb builder delete demo-builder --cluster 2> /dev/null
pb builder delete default --cluster 2> /dev/null

# Requires you to be logged into registry.pivotal.io via Docker
pb stack update --build-image registry.pivotal.io/tbs-dependencies/build:1584989900 --run-image registry.pivotal.io/tbs-dependencies/run:1584989900

pb builder apply -f custom-builder.yml