# Install instructions

This is for TBS 0.1.0.

Follow these steps in order:
1. Install PKS 1.6+. Enable clusters to use UAA as OIDC provider
1. pks login
1. Create cluster
1. Docker login to your registry
1. Docker login to registry.pivotal.io
1. Modify and run relocate.sh
1. Install storage class into your cluster
1. Modify and run install.sh
1. pb secrets registry apply -f registry.yml



