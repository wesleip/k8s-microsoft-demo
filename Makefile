.DEFAULT_GOAL := create

pre:
	@kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.3/config/manifests/metallb-native.yaml
	@kubectl wait --namespace metallb-system --for=condition=ready pod --selector=app=metallb --timeout=300s
	@kubectl apply -f https://raw.githubusercontent.com/techiescamp/kubeadm-scripts/refs/head/main/manifests/metrics-server.yaml
	@kubectl apply -f infra-manifests/

helm:
	@helmfile apply

create:
	@kind create cluster --name demo --config ./kind-cluster/kind.yaml

up: create pre helm

build:
	@kubectl kustomize ./base/

deploy:
	@helm upgrade --install sealed-secrets -n kube-system --set-string fullnameOverride=sealed-secrets-controller sealed-secrets/sealed-secrets
	@kubeseal < k8s-manifests/order-service/order-secret.yaml -oyaml | kubectl neat > base/sealed-secret-order.yaml
	@kubeseal < k8s-manifests/rabbitmq/rabbit-secret.yaml -oyaml | kubectl neat > base/sealed-secret-rabbitmq.yaml
	@kubectl apply -k ./base/

delete:
	@kubectl delete -k ./base/

destroy:
	@kind delete clusters demo
