#! /usr/bin/env bash



# docker_repository is where updated Stack images are relocated to

# docker_registry, registry_username and registry_password are used to push builder images

# custom_builder_image is the `default` builder



# duffle is only used to install TBS so I remove the duffle folder every time I install TBS
rm -rf ~/.duffle

DOCKERHUB_USERNAME=username
GCP_PROJECT=project

#DOCKER_REPOSITORY="index.docker.io/${DOCKERHUB_USERNAME}"
DOCKER_REPOSITORY="gcr.io/${GCP_PROJECT}"

#DOCKER_REGISTRY="index.docker.io"
DOCKER_REGISTRY="gcr.io"

#REGISTRY_USERNAME=${DOCKERHUB_USERNAME}
REGISTRY_USERNAME="oauth2accesstoken"

#REGISTRY_PASSWORD="password"
REGISTRY_PASSWORD="$(gcloud auth print-access-token)"

#CUSTOM_BUILDER_IMAGE="index.docker.io/${DOCKERHUB_USERNAME}/tbs-default-cluster-builder"
CUSTOM_BUILDER_IMAGE="gcr.io/${GCP_PROJECT}/tbs-default-cluster-builder"

duffle install tbs -c ./credentials.yml  \
  --set kubernetes_env=tbs \
  --set docker_repository="${DOCKER_REPOSITORY}" \
  --set docker_registry="${DOCKER_REGISTRY}" \
  --set registry_username="${REGISTRY_USERNAME}" \
  --set registry_password="${REGISTRY_PASSWORD}" \
  --set custom_builder_image="${CUSTOM_BUILDER_IMAGE}" \
  -f ./build-service-0.1.0.tgz \
  -m ./relocated.json
