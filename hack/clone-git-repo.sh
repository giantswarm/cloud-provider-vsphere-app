#!/bin/bash

set -euo pipefail
set -x 

base_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)

REPO="${1}"
BRANCH_OR_TAG="${2}"
CLONE_FOLDER="${3}"

cd "$base_dir/tmp"
rm -Rf "$CLONE_FOLDER"

git clone --depth=1 --branch "${BRANCH_OR_TAG}" "https://github.com/${REPO}.git" "$CLONE_FOLDER"


# remove cluster-api-provider-vsphere from the stack
# popd

# remove $TMPDIR from the stack
# popd

# copy upstream generated release-manifests into origin
# cp -v "${TMPDIR}/${REPO_NAME}/out/infrastructure-components.yaml" "../config/kustomize/input/"
