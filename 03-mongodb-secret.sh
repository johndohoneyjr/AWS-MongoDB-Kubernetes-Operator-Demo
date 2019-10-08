
#! /bin/bash

kubectl -n mongodb \
  create secret generic mongo-cloud-mgr \
  --from-literal="user=<public portion of API Key>" \
  --from-literal="publicApiKey=<private portion of API Key>"

kubectl describe secrets/mongo-cloud-mgr -n mongodb