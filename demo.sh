#! /usr/bin/env bash

source ./demo-magic.sh

clear


# Ahead of time:
# 1. Follow all the steps in INSTALL.txt
# 2. Delete mysql, tbs-default-cluster-builder, and tbs-custom-cluster-builder image repos
# 3. cleanup.sh

# Show slides:
# https://docs.google.com/presentation/d/14iOJZEasytUV_OMYRBGLjowL2RSJ_ionzzkBBM7GiQ4

pe 'kubectl apply -f kpack-resources/namespace.yml'

pe 'secrets/harbor.sh'

pe 'bat kpack-resources/store.yml'
pe 'kubectl apply -f kpack-resources/store.yml'

pe 'bat kpack-resources/stack.yml'
pe 'kubectl apply -f kpack-resources/stack.yml'

pe 'bat kpack-resources/custom-builder.yml'
pe 'kubectl apply -f kpack-resources/custom-builder.yml'

pe 'bat kpack-resources/image.yml'

# First build, CONFIG
pe 'kubectl apply -f kpack-resources/image.yml'
pe 'kp build list mysql'
pe 'kp build logs mysql -b 1'
pe 'kp build status mysql -b 1'

# watch since we trigger the commit build in browser
pe 'watch kp build list mysql'
# Second build, COMMIT
# Go change the code in GitHub
# Watch the COMMIT build
pe 'kp build logs mysql -b 2'
pe 'kp build status mysql -b 2'

# Third build, STACK
pe 'kp build list mysql'
# Requires you to be logged into registry.pivotal.io via Docker
pe 'kp stack update demo-stack --build-image registry.pivotal.io/tbs-dependencies/build:1584989900 --run-image registry.pivotal.io/tbs-dependencies/run:1584989900'
# Watch because I want to show how fast the Stack image build is
pe 'watch kp build list mysql'
pe 'kp build logs mysql -b 3'

