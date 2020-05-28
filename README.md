TBS 0.1.0

Install PKS 1.6+
    * Enable clusters to use UAA as OIDC provider

Create new non-admin PKS user with uaac

pks login with the non-admin user
    * can confirm by looking at ~/.pks/creds.yml

Create cluster

Docker login to your registry
Docker login to registry.pivotal.io

Modify and run relocate.sh

Install storage class (in ../pks)

Modify and run install.sh
# stack, store, and default builder are cluster scope

pb secrets registry apply -f registry.yml



