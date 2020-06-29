#! /usr/bin/env bash
set -euo pipefail

# This will prompt for the password
kp secret create dockerhub-creds \
--namespace tbs-demo \
--dockerhub DOCKER-HUB-ID