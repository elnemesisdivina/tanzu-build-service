#! /usr/bin/env bash

source ./demo-magic.sh

clear


# Ahead of time:
# 1. Follow all the steps in INSTALL.txt
# 2. Delete mysql, tbs-default-cluster-builder, and tbs-custom-cluster-builder image repos
# 3. cleanup.sh

# Show slides:
# https://docs.google.com/presentation/d/14iOJZEasytUV_OMYRBGLjowL2RSJ_ionzzkBBM7GiQ4

pe 'bat image-mysql.yml'

# First build, CONFIG
pe 'pb image apply -f image-mysql.yml'
pe 'pb image builds index.docker.io/techgnosis/mysql'
pe 'pb image logs index.docker.io/techgnosis/mysql -b 1 -f'
pe 'pb image build index.docker.io/techgnosis/mysql -b 1'

# watch since we trigger the commit build in browser
pe 'watch pb image builds index.docker.io/techgnosis/mysql'
# Second build, COMMIT
# Go change the code in GitHub
# Watch the COMMIT build
pe 'pb image logs index.docker.io/techgnosis/mysql -b 2 -f'
pe 'pb image build index.docker.io/techgnosis/mysql -b 2'

# Third build, STACK
pe 'pb image builds index.docker.io/techgnosis/mysql'
# Requires you to be logged into registry.pivotal.io via Docker
pe 'pb stack update --build-image registry.pivotal.io/tbs-dependencies/build:1586272925 --run-image registry.pivotal.io/tbs-dependencies/run:1586272925'
# Watch because I want to show how fast the Stack image build is
pe 'watch pb image builds index.docker.io/techgnosis/mysql'
pe 'pb image logs index.docker.io/techgnosis/mysql -b 3 -f'

