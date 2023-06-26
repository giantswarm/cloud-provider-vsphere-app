#!/bin/bash

set -euo pipefail
set -x 

base_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
chart_dir="./helm/cloud-provider-vsphere/charts/cloud-provider-for-vsphere"

cd "$base_dir"

"./hack/clone-git-repo.sh" \
    "giantswarm/cloud-provider-vsphere" \
    "improve-helm-chart" \
    "cloud-provider-vsphere"

rm -Rf "$chart_dir"
mkdir "$chart_dir"

cp -R \
  "./tmp/cloud-provider-vsphere/charts/vsphere-cpi/." \
  "$chart_dir"

# Customizations

cp -R \
  "./config/cloud-provider-for-vsphere/overwrites/." \
  "$chart_dir/"
