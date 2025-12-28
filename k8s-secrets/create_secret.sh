#!/usr/bin/env bash
set -euo pipefail

echo "Install kubeseal for k8s secrets"
brew install kubeseal

read -rp "👽 What is your secret name? " secret_name
read -rp "👽 What is your secret key? " secret_key
read -rp "👽 What is your secret value? " secret_value

echo -n $secret_value | kubectl create secret generic $secret_name --dry-run=client --from-file=$secret_key=/dev/stdin -o yaml >$secret_name.yaml
kubeseal -o yaml --scope namespace-wide <$secret_name.yaml >${secret_name}secret.yaml
#kubeseal -o yaml --scope strict <$secret_name.yaml >${secret_name}secret.yaml