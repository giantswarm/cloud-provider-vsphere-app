#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

YQ="./bin/yq"

f="helm/cloud-provider-vsphere/charts/vsphere-csi-driver/templates/apps_v1_deployment_vsphere-csi-controller.yaml"
${YQ} e '.spec.template.spec.securityContext.remove-this-key="'"
{{- with .Values.podSecurityContext }}
  {{- . | toYaml | nindent 8 }}
{{- end }}
"'" | .spec.template.spec.containers[].securityContext.remove-this-key="'"
{{- with .Values.containerSecurityContext }}
  {{- . | toYaml | nindent 12 }}
{{- end }}
"'"' ${f} > ${f}.tmp
cat ${f}.tmp | grep -v 'remove-this-key' > ${f}
rm -rf ${f}.tmp

# Replace the upstream psp condition with our own.

cpi_psp_file="helm/cloud-provider-vsphere/charts/cloud-provider-for-vsphere/templates/podsecuritypolicy.yaml"

sed -i 's/{{- if \.Values\.podSecurityPolicy\.enabled }}/{{- if not .Values.global.podSecurityStandards.enforced }}/g' "$cpi_psp_file"
