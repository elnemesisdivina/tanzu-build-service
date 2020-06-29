#! /usr/bin/env bash
set -euo pipefail

kp secret create gcr-creds \
--namespace tbs-demo \
--gcr /tmp/GCR-SERVICE-ACCOUNT.json