#! /usr/bin/env bash
set -euo pipefail

# This will prompt for the password
REGISTRY_PASSWORD=Harbor12345 kp secret create harbor2-creds \
--namespace tbs-demo \
--registry harbor.lab.home \
--registry-user admin