##@ App

OS ?= $(shell go env GOOS 2>/dev/null || echo linux)
ARCH ?= $(shell go env GOARCH 2>/dev/null || echo amd64)
KUSTOMIZE := ./bin/kustomize
KUSTOMIZE_VERSION ?= v4.5.7
YQ = ./bin/yq
YQ_VERSION := 4.31.2

.PHONY: all
all: update-cpi-chart update-csi-chart apply-custom-patches-for-csi update-kubevip-chart update-kubevip-cloud-provider-chart increase-chart-version
	@$(call say,Sync has been done ✓)

.PHONY: update-cpi-chart
update-cpi-chart:
	@$(call say,CPI helm chart)
	./hack/update-cpi-chart.sh
	./hack/common-labels-injector.sh cloud-provider-for-vsphere

.PHONY: apply-custom-patches-for-csi
apply-custom-patches-for-csi: $(YQ) ## apply giantswarm specific patches that are not possible via kustomize
	@$(call say,Custom yq magic for CSI)
	./hack/custom-patches.sh
	./hack/common-labels-injector.sh vsphere-csi-driver

.PHONY: update-csi-chart
update-csi-chart: $(KUSTOMIZE)
	@$(call say,CSI helm chart)
	./hack/update-csi-chart.sh $(KUSTOMIZE)

.PHONY: update-kubevip-chart
update-kubevip-chart:
	@$(call say,Kubevip helm chart)
	./hack/update-kubevip-chart.sh
	./hack/common-labels-injector.sh kube-vip

.PHONY: update-kubevip-cloud-provider-chart
update-kubevip-cloud-provider-chart:
	@$(call say,Kubevip cloud provider helm chart)
	./hack/update-kubevip-cloud-provider-chart.sh
	./hack/common-labels-injector.sh kube-vip-cloud-provider

.PHONY: increase-chart-version
increase-chart-version:
	@$(call say,Increase parent chart SemVer version)
	./hack/increase-chart-version.sh

$(KUSTOMIZE): ## Download kustomize locally if necessary.
	@$(call say,Download Kustomize)
	mkdir -p $(dir $@)
	curl -sfL "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F$(KUSTOMIZE_VERSION)/kustomize_$(KUSTOMIZE_VERSION)_$(OS)_$(ARCH).tar.gz" | tar zxv -C $(dir $@)
	chmod +x $@
	@echo "kustomize downloaded"

$(YQ): ## Download yq locally if necessary.
	@$(call say,Download yq)
	mkdir ./bin || true
	curl -sfL https://github.com/mikefarah/yq/releases/download/v$(YQ_VERSION)/yq_$(OS)_$(ARCH) > $@
	chmod +x $@
	@echo "yq downloaded"


ifndef NO_COLOR
YELLOW=\033[0;33m
# no color
NC=\033[0m
endif

define say
echo "\n$(shell echo "$1 " | tr '[:rune:]' '=')\n $(YELLOW)$1$(NC)\n$(shell echo "$1 " | tr '[:rune:]' '=')"
endef
