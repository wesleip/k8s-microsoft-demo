# k8s-microsoft-demo
## Objetivo do projeto

Este projeto tem como objetivo explorar e demonstrar o uso de Kubernetes para gerenciar e orquestrar aplicações containerizadas. Através deste estudo, serão abordados os seguintes pontos principais:

* Deploy e gerenciamento de containers: Entendimento dos processos de deploy, escalabilidade e atualizações contínuas de aplicações utilizando Kubernetes.

* Configuração de clusters: Implementação e configuração de clusters de Kubernetes, incluindo a distribuição de workloads em múltiplos nós.

* Aplicações resilientes e escaláveis: Desenvolvimento de aplicações que possam escalar de forma eficiente e lidar com falhas em um ambiente de produção em Kubernetes.

O objetivo é obter um entendimento completo sobre como o Kubernetes pode ser usado para suportar aplicações complexas em ambientes de produção, focando na automação, escalabilidade, segurança e alta disponibilidade.

Acesse [aqui](https://github.com/Azure-Samples) o repositório oficial Azure-Samples.

## Arquitetura do Projeto

![Imagem](architecture/sample.png)

## Descrição do projeto

A aplicação de exemplo deste repositório é um aplicativo store-front básico, incluindo as seguintes implantações e serviços do Kubernetes:

* Frontend: Aplicativo Web para visualização de produtos e realização de pedidos
* Serviço do produto: Exibe informações do produto
* Serviço de pedido: Realiza pedidos
* Rabbit MQ: Fila de mensageria dos pedidos.

## Tecnologias utilizadas no projeto

* .NET Core
* RabbitMq
* Docker
* Kubernetes