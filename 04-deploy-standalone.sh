#! /bin/bash

# 
# (6) Deployment Continues
# https://docs.mongodb.com/kubernetes-operator/master/tutorial/create-project-using-configmap/#create-k8s-project
kubectl apply -f opsMgr.yaml

#
# Deploy the Standalone Set
kubectl apply -f standalone.yaml

#
# Track Status of RS
kubectl get mdb standalone -n mongodb -o yaml -w

##
# Create a AWS LB and a public IP to connect
##
kubectl expose svc standalone-svc-external --port=27017 --target-port=27017 --name=external-connect-mongo --type=LoadBalancer -n mongodb

#
# Be patient, this is SLOW AS HEEEELLLLLLL!!!
#
kubectl get svc -n mongodb
ping <external LB address> 
# ping ab01aba49e80d11e9854e0ea84eba664-71958668.us-west-2.elb.amazonaws.com
# icmp fails, but you dont get unreachable host error, then you can conect

# use Compass to finish demo