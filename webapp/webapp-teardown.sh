#!/bin/bash

kubectl delete configmaps redishost

kubectl delete -f csye-app.yaml
kubectl delete -f csye-service.yaml