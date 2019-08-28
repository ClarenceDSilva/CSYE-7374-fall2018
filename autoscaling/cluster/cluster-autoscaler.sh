#!/bin/bash

# Copyright 2018 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

#Set all the variables in this section
CLUSTER_NAME="csye6225-spring2018-dsilvac.me"
CLOUD_PROVIDER=aws
IMAGE=k8s.gcr.io/cluster-autoscaler:v1.1.0
MIN_NODES=1
MAX_NODES=5
AWS_REGION=us-east-1
INSTANCE_GROUP_NAME="nodes"
ASG_NAME="${INSTANCE_GROUP_NAME}.${CLUSTER_NAME}"   #ASG_NAME should be the name of ASG as seen on AWS console. 
#IAM_ROLE="masters.${CLUSTER_NAME}"                  #Where will the cluster-autoscaler process run? Currently on the master node. 
SSL_CERT_PATH="/etc/ssl/certs/ca-certificates.crt"  #(/etc/ssl/certs for gce, /etc/ssl/certs/ca-bundle.crt for RHEL7.X)
#KOPS_STATE_STORE="s3://___"        #KOPS_STATE_STORE might already be set as an environment variable, in which case it doesn't have to be changed.


addon=cluster-autoscaler.yml
wget -O ${addon} https://raw.githubusercontent.com/kubernetes/kops/master/addons/cluster-autoscaler/v1.8.0.yaml

sed -i -e "s@{{CLOUD_PROVIDER}}@${CLOUD_PROVIDER}@g" "${addon}"
sed -i -e "s@{{IMAGE}}@${IMAGE}@g" "${addon}"
sed -i -e "s@{{MIN_NODES}}@${MIN_NODES}@g" "${addon}"
sed -i -e "s@{{MAX_NODES}}@${MAX_NODES}@g" "${addon}"
sed -i -e "s@{{GROUP_NAME}}@${ASG_NAME}@g" "${addon}"
sed -i -e "s@{{AWS_REGION}}@${AWS_REGION}@g" "${addon}"
sed -i -e "s@{{SSL_CERT_PATH}}@${SSL_CERT_PATH}@g" "${addon}"

kubectl apply -f ${addon}

printf "Done\n"