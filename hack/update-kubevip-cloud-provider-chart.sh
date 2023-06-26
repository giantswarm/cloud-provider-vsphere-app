#!/bin/bash

set -euo pipefail
set -x 

base_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
chart_dir="./helm/cloud-provider-vsphere/charts/kube-vip-cloud-provider"

cd "$base_dir"

"./hack/clone-git-repo.sh" \
    "kube-vip/helm-charts" \
    "kube-vip-cloud-provider-0.2.2" \
    "kube-vip-cloud-provider"

rm -Rf "$chart_dir"

cp -R \
  "./tmp/kube-vip/charts/kube-vip-cloud-provider" \
  "$chart_dir"

# Customizations

cp -R \
  "./config/kube-vip-cloud-provider/overwrites/." \
  "$chart_dir/"
