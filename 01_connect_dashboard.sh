#! /bin/bash
clear
#
echo
echo "The Login is token has been copied to the Clipboard, Select Token to login, and paste the OAuth Token to login into the Kubernetes Dashbaord"
echo
#
pbcopy < `kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | awk '/^deployment-controller-token-/{print $1}') | awk '$1=="token:"{print $2}' `
#
# This runs the Kube Proxy in the background and launches the UI in Chrome
#
kubectl proxy &
open -a "Google Chrome" http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

kubectl get nodes

