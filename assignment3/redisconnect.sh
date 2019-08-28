#!/bin/bash

export REDISHOST_IP=$(kubectl describe pod -l role=master | grep -w "^IP:" | awk '{print $2}')
kubectl create configmap redishost --from-literal=REDISHOST=${REDISHOST_IP}
kubectl get configmaps redishost -o yaml

