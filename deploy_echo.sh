#!/bin/env bash
echo "Generating Kubernetes manifests"
helm3 template echo echo > echo.yaml
echo "Creating Namespace: echo"
kubectl create ns echo
echo "Deploying app to the echo namespace"
kubectl -n echo apply -f echo.yaml
