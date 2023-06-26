#!/bin/bash

set -euo pipefail

base_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
chart_dir="./helm/cloud-provider-vsphere/charts/vsphere-csi-driver"

cd "$base_dir"

"./hack/clone-git-repo.sh" \
  "kubernetes-sigs/vsphere-csi-driver" \
  "v2.7.1" \
  "vsphere-csi-driver"

rm -Rf "$chart_dir"

cp -R \
  "./config/vsphere-csi-driver/overwrites/." \
  "$chart_dir/"

cp -R \
  "./tmp/vsphere-csi-driver/manifests/vanilla/vsphere-csi-driver.yaml" \
  "./config/vsphere-csi-driver/input/"

# Customizations

kubectl kustomize "./config/vsphere-csi-driver" -o "./config/vsphere-csi-driver/tmp"

find \
  "./config/vsphere-csi-driver/tmp/" \
  -name '*.yaml' -exec \
  cp -prv '{}' \
  "$chart_dir/templates/" ';'

rm -Rf "$chart_dir/templates/apps_v1_daemonset_vsphere-csi-node-windows.yaml"