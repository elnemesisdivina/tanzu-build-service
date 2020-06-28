#! /usr/bin/env bash

kp image delete demo-golang
kp custom-builder delete my-custom-builder


# Requires you to be logged into registry.pivotal.io via Docker
pb stack update --build-image registry.pivotal.io/tbs-dependencies/build:1584989900 --run-image registry.pivotal.io/tbs-dependencies/run:1584989900

kp custom-builder create my-custom-builder harbor2.lab.home:30003/tbs/my-custom-builder \
--order custom-builder.yml