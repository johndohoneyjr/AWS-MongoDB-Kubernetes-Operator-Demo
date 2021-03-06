#! /bin/bash


## Before starting, delete all current projects
## Create a new one, copy the project name to opsMgr.yaml 
eksctl create cluster \
--name opsMgrDemo1 \
--version 1.13 \
--nodegroup-name standard-workers \
--node-type t3.xlarge \
--nodes 3 

# BE SURE TO ADD ALL NODES to the API Whitelist in Atlas
#
# Get External IP 
kubectl get nodes -o jsonpath='{ $.items[*].status.addresses[?(@.type=="ExternalIP")].address }'
echo
echo "Be sure to add external IPs to API Whitelist..."
