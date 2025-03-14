#!/bin/bash

set -euo pipefail
set -x

base_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
chart_dir="./helm/cloud-provider-vsphere"
YQ="./bin/yq"

cd "$base_dir"

# The goal here is to control versions only from Chart.yaml overrides with Renovate and grab that version here.
VERSION=$(yq e '.version' "config/cloud-provider-for-vsphere/overwrites/Chart.yaml")

"./hack/clone-git-repo.sh" \
  "/kubernetes/cloud-provider-vsphere" \
  "v$VERSION" \
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

# replace the controller image
${YQ} eval --inplace 'with(select(.daemonset.image != null); .daemonset.image = "gsoci.azurecr.io/giantswarm/cloud-provider-vsphere")' "$chart_dir/values.yaml"
# rename the chart to ensure it stays consistent
${YQ} eval --inplace 'with(select(.name != null); .name = "cloud-provider-vsphere")' "$chart_dir/Chart.yaml"
