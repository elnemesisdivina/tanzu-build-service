#! /usr/bin/env bash



# docker_repository is where updated Stack images are relocated to

# docker_registry, registry_username and registry_password are used to push builder images

# custom_builder_image is the `default` builder



# duffle is only used to install TBS so I remove the duffle folder every time I install TBS
rm -rf ~/.duffle

duffle install tbs -c ./credentials.yml  \
  --set kubernetes_env=tbs \
  --set docker_repository="index.docker.io/techgnosis" \
  --set docker_registry=index.docker.io \
  --set registry_username="techgnosis" \
  --set registry_password="password" \
  --set custom_builder_image="index.docker.io/techgnosis/tbs-default-cluster-builder" \
  -f ./build-service-0.1.0.tgz \
  -m ./relocated.json
