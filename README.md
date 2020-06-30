# Install instructions

This is for TBS 0.2.0.

Follow these steps in order:
1. Create a K8s cluster of any kind
1. `docker login <your registry>`
1. `docker login registry.pivotal.io`
1. Modify and run `install/relocate.sh`
1. Install default StorageClass into your cluster
1. Modify and run `install/install.sh`



