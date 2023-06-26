#!/bin/bash

set -euo pipefail
set -x 

base_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
chart_dir="./helm/cloud-provider-vsphere/charts/kube-vip"

cd "$base_dir"

"./hack/clone-git-repo.sh" \
    "kube-vip/helm-charts" \
    "kube-vip-0.4.4" \
    "kube-vip"

rm -Rf "$chart_dir"

cp -R \
  "./tmp/kube-vip/charts/kube-vip" \
  "$chart_dir"

# Customizations

cp -R \
  "./config/kube-vip/overwrites/." \
  "$chart_dir/"
