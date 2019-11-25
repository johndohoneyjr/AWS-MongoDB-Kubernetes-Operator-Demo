# AWS MongoDB-Kubernetes Operator Example


This demo uses the MongoDb - Kubernetes Operator on AWS.  The cluster is provisioned with EKSCTL

  - Makes use of the Atlas Cloud Manager
  - Uses a single Mongo Db Instance -- No scale or HA (but be converted to a replicaSet)
  - Demonstrated Use of Compass for connection

# New Features!

  - Latest versions of Ops Manager now come with a single Agent.  Prior to 4.2, 3 agents were used (backup, monitoring, and automation)


### Demo Process:
  - Make sure your AWS Key and secret are in your ~/.aws/credentials
  -- git clone this directory, then cd into it, then...
  -- https://github.com/mongodb/mongodb-enterprise-kubernetes You will use this to load the CRDs and Operator
  - The shell scripts are sequentially prefixed, runs this in prefix - sequential order.
  - Be sure to get all external IP's -- you need to Whitelist all of them in order for this to work without hiccups.  This is done at the Organization | Access | API Keys level
  - 04-deploy-standalone.sh shoould be run a command at a time.

### Notes
The MongoDB Kuybernetes Operator is in a sub-directory of this repo, no need to dopwnload.
(./mongodb-enterprise-kubernetes)

Most of the ConfigMaps have areas that require input of values from your Cloud or Ops Manager, these include:

  - Organization ID
  - Project Name
  - API Key - Public Key
  - API Key - Private Key

As you create you Kubernetes secret, you will need the values of:
  - API Key - Public Key (user)
  - API Key - Private Key

### Before you start

The OpsManager CRD requires that you add a Project Name and Organization ID:

## Ops-Manager CRD Example (OpsMgr.yaml)
```
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: opsmanager-config
  namespace: mongodb

data:
  projectName: Project-Name-Goes-Here
  orgId: 5dead000dead697f56dead
  baseUrl: https://cloud.mongodb.com
```
## Kubernetes Secret for Ops Manager Example ( 03-mongodb-secret.sh )

```
kubectl -n mongodb \
  create secret generic mongo-cloud-mgr \
  --from-literal="user=<public-key>" \
  --from-literal="publicApiKey=<private-key-store-in-a-vault>"
```
