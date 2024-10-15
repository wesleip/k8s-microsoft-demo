.DEFAULT_GOAL := create

pre:
	@kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.3/config/manifests/metallb-native.yaml
	@kubectl wait --namespace metallb-system --for=condition=ready pod --selector=app=metallb --timeout=300s
	@kubectl apply -f infra-manifests/

create:
	@kind create cluster --name demo --config ./kind-cluster/kind.yaml

up: create pre

build:
	@kubectl kustomize /base

deploy:
	@kubectl apply -k /base/kustomization.yaml

destroy:
	@kind delete clusters kind
