
<!-- README.md is generated from README.Rmd. Please edit that file -->

# beaverdown

a beaver worker for dealing with k8s/k3s events in R (under developing)

## Exsit functions

1.  docker_install
2.  minikube_install
3.  placeholder
4.  kubectl_install
5.  minikube_start
6.  utils-pipe
7.  kubectl_apply

> for example

> kubectl apply -f nginx.yaml

> kubectl apply -f hello-cronjob.yaml

> kubectl apply -f hello-job.yaml

> kubectl apply -f hellok8s-secret.yaml

> kubectl apply -f hellok8s.yaml

> kubectl apply -f hellok8s.yaml -n dev

> kubectl apply -f deployment.yaml -n dev

> kubectl apply -f namespaces.yaml

> kubectl apply -f ingress.yaml

> kubectl apply -f service-hellok8s-clusterip.yaml

8.  kubectl_get

> for example

> kubectl get deployments

> kubectl get service

> kubectl get ingress

> kubectl get namespaces

> kubectl get configmap –all-namespaces

> kubectl get jobs

> kubectl get cronjob

> kubectl get secret

> kubectl get endpoints

9.  kubectl_portforward

> for example

> kubectl port-forward nginx-pod 4000:80

10.kubectl_exec

> for example

> kubectl exec -it nginx-pod /bin/bash

> kubectl exec nginx-pod – ls

11. kubectl_logs

> for example

> kubectl logs –follow nginx-pod

12. kubectl_delete

> for example

> kubectl delete pod nginx-pod

> pod “nginx-pod” deleted

> kubectl delete -f nginx.yaml

> pod “nginx-pod” deleted

## Roadmap functions

1.  kubectl_describe

> for example

> kubectl describe pod hellok8s-68f47f657c-zwn6g

## Reference

1.  [guangzhengli/k8s-tutorials](https://github.com/guangzhengli/k8s-tutorials)
2.  kubernetes temples by lunuan
