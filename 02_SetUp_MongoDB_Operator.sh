#! /bin/bash

#
# (3) Create the namespace for your Kubernetes deployment.
kubectl create namespace mongodb

#
# Sanity check
kubectl get namespace

cd $HOME/AWS-MongoDB-Kubernetes-Operator-Demo/scripts

# 
# Install the Custom Resource Definitions
#
kubectl apply -f ./mongodb-enterprise-kubernetes/crds.yaml

#
# Deploy the operator (5)
kubectl apply -f ./mongodb-enterprise-kubernetes/mongodb-enterprise.yaml
