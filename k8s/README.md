# Instalação cluster RABBITMQ no Kubernetes

    kubectl apply -f "https://github.com/rabbitmq/cluster-operator/releases/latest/download/cluster-operator.yml"

    kubectl apply -f ./k8s/rabbit_cluster.yml 

    kubectl krew install rabbitmq

    kubectl rabbitmq get rabbit

    kubectl rabbitmq manage rabbit

- ref: <https://www.rabbitmq.com/kubernetes/operator/install-operator.html>
- ref: <https://www.youtube.com/watch?v=GxdyQSUEj5U>
