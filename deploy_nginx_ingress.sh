#!/bin/env bash
echo "Creating namespace nginx-ingress"
kubectl create ns nginx-ingress
echo "Install Ngnix Ingress with Helm3"
helm3 install stable/nginx-ingress --namespace nginx-ingress nginx-ingress \
--set controller.service.ports.http=3333 \
--set controller.service.enableHttps=false rbac.create=true    -g
