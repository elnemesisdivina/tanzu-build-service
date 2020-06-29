#! /usr/bin/env bash
set -euo pipefail

# This will prompt for the password
kp secret create harbor2-creds \
--namespace tbs-demo \
--registry harbor2.lab.home:30003 \
--registry-user admin