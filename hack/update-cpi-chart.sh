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
# add kamaji configuration
${YQ} eval --inplace '.kamaji.enabled = false' "$chart_dir/values.yaml"
${YQ} eval --inplace '. = {"kamaji": .kamaji} + .' "$chart_dir/values.yaml"

# Add conditional rendering to daemonset - only render if kamaji is not enabled
sed -i '1s/^/{{- if not .Values.kamaji.enabled -}}\n/' "$chart_dir/templates/daemonset.yaml"
echo '{{- end }}' >> "$chart_dir/templates/daemonset.yaml"

# we need to reset the version field in Chart.yaml to match the
# latest release of this repo. So we fetch it with jq and then
# inject it back into the Chart.yaml to avoid the upstream change and let build suite update it.
LATEST_VERSION=$(curl -s https://api.github.com/repos/giantswarm/cloud-provider-vsphere-app/releases/latest | jq -r .name)
# remove leading 'v' if present
LATEST_VERSION="${LATEST_VERSION#v}"
# replace version in Chart.yaml
sed -i -E "s/^version.*$/version: ${LATEST_VERSION}/" "${chart_dir}/Chart.yaml"