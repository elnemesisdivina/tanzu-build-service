#! /usr/bin/env bash
set -euo pipefail

REGISTRY_PASSWORD=Harbor12345 kp secret create harbor2-creds \
--namespace tbs-demo \
--registry harbor.lab.home \
--registry-user admin