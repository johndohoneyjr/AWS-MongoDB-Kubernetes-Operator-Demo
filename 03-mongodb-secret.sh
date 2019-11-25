
#! /bin/bash

kubectl -n mongodb \
  create secret generic mongo-cloud-mgr \
  --from-literal="user=bciyshqs" \
  --from-literal="publicApiKey=a26fbd97-112b-4955-a2b2-3a7059f376e3"

kubectl describe secrets/mongo-cloud-mgr -n mongodb