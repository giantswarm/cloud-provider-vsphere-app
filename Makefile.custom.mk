##@ App

.PHONY: all
all: update-cpi-chart update-csi-chart update-kubevip-chart update-kubevip-cloud-provider-chart

.PHONY: update-cpi-chart
update-cpi-chart: 
	./hack/update-cpi-chart.sh
	./hack/common-labels-injector.sh cloud-provider-for-vsphere

.PHONY: update-csi-chart
update-csi-chart: 
	./hack/update-csi-chart.sh
	./hack/common-labels-injector.sh vsphere-csi-driver

.PHONY: update-kubevip-chart
update-kubevip-chart: 
	./hack/update-kubevip-chart.sh
	./hack/common-labels-injector.sh kube-vip

.PHONY: update-kubevip-cloud-provider-chart
update-kubevip-cloud-provider-chart: 
	./hack/update-kubevip-cloud-provider-chart.sh
	./hack/common-labels-injector.sh kube-vip-cloud-provider
